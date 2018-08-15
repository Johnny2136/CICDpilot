require 'ruby_stix'

namespace :stix_validator do
  ERR_NO_FILEPATH_SPECIFIED = 'A file path is required as the single ' +
      'argument (glob-style wildcards are supported) to specify ' +
      'XML file(s) to validate.'

  task :ciap, [:filepath] => :environment do |t, args|
    # Validate a Stix XML file via the XSD files at the locations specified in
    # the standard schemaLocation attribute generated by CIAP for Stix 1.1.1.
    args.filepath.blank? ?
        $stderr.puts(ERR_NO_FILEPATH_SPECIFIED) :
        validate_task("#{args.filepath}", 'ciap')
  end

  task :ciap_offline, [:filepath] => :environment do |t, args|
    # Validate a Stix XML file via the XSD files at the locations specified in
    # the standard schemaLocation attribute generated by CIAP for Stix 1.1.1
    # but use the copies of these files bundled locally into the stix gem.
    args.filepath.blank? ?
        $stderr.puts(ERR_NO_FILEPATH_SPECIFIED) :
        validate_task("#{args.filepath}", 'ciap_offline')
  end

  task :schemaloc, [:filepath] => :environment do |t, args|
    # Validate a Stix XML file via the XSD files at the locations specified in
    # the schemaLocation attribute of the XML file.
    args.filepath.blank? ?
        $stderr.puts(ERR_NO_FILEPATH_SPECIFIED) :
        validate_task("#{args.filepath}", 'schemaloc')
  end

  task :schemaloc_offline, [:filepath] => :environment do |t, args|
    # Validate a Stix XML file via the XSD files at the locations specified in
    # the schemaLocation attribute of the XML file but use the copies of these
    # files bundled locally into the stix gem.
    args.filepath.blank? ?
        $stderr.puts(ERR_NO_FILEPATH_SPECIFIED) :
        validate_task("#{args.filepath}", 'schemaloc_offline')
  end

  # Validate a Stix XML file via the XSD files at the locations specified in
  # the schemaLocation attribute of the XML file.
  def validate_schemaloc_task(xml, validator)
    validator.validate_via_schema_loc(xml)
  end

  # Validate a Stix XML file via the XSD files at the locations specified in
  # the schemaLocation attribute of the XML file but use the copies of these
  # files bundled locally into the stix gem.
  def validate_schemaloc_offline_task(xml, validator)
    validator.validate_via_schema_loc(xml, true)
  end

  # Validate a Stix XML file via the XSD files at the locations specified in
  # the standard schemaLocation attribute generated by CIAP for Stix 1.1.1.
  def validate_ciap_task(xml, validator)
    validator.validate_ciap_stix(xml)
  end

  # Validate a Stix XML file via the XSD files at the locations specified in
  # the standard schemaLocation attribute generated by CIAP for Stix 1.1.1
  # but use the copies of these files bundled locally into the stix gem.
  def validate_ciap_offline_task(xml, validator)
    validator.validate_ciap_stix(xml, true)
  end

  # Perform the validation and print the results for the file glob path and
  # task name.
  def validate_task(filepath, task_name)
    # Create an instance of the Stix::Xsd::Validator class to perform
    # validation.
    validator = Stix::Xsd::Validator.new

    xml_files = Dir.glob(filepath).sort
    xml_files.each do |xml_file|
      puts "[-] Performing xml schema validation on #{xml_file}"
      puts '=================================================================' +
               '==============='
      xml = File.read(xml_file)
      errors = nil
      case task_name
        when 'ciap'
          errors = validate_ciap_task(xml, validator)
        when 'ciap_offline'
          errors = validate_ciap_offline_task(xml, validator)
        when 'schemaloc'
          errors = validate_schemaloc_task(xml, validator)
        when 'schemaloc_offline'
          errors = validate_schemaloc_offline_task(xml, validator)
      end
      puts "[-] Results: #{xml_file}"

      validator.errors.each do |error|
        puts "[!] STIX Validator Error: #{error}"
      end

      unless errors.nil?
        puts "[#{errors.empty? ? '+' : '!'}] XML Schema: " +
                 "#{errors.empty? ? 'True' : 'False'}"
        errors.each do |error|
          puts "    [!] #{error.error? ? 'ERROR' : ''}" +
                   "#{error.warning? ? 'WARNING' : ''}" +
                   "#{error.fatal? ? 'FATAL' : ''}" +
                   "#{error.error? || error.warning? || error.fatal? ?
                       '' : 'ERROR'}" +
                   "#{error.line.nil? ? '' : ':LINE #' + error.line.to_s}" +
                   ":#{error.message}"
        end
      end
      puts '=================================================================' +
               '==============='
    end
  rescue Exception => e
    $stderr.puts "ERROR: #{e.message}"
  end
end

