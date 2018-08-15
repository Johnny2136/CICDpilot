# PilotPOC
## Major Activities:
* Develop architecture 
  * Develop architecture for efficient CI/CD 
  * Orchestration across air-gapped (simulated) environment
* Infrastructure setup 
  * Basic infrastructure setup across environments in Redhat Labs and VMC (AWS) 
  * Basic CI/CD pipeline setup and validation
* Containerize CR18-22 
  * Containerize CR18-22 in Redhat Labs environment 
  * Run build through CI/CD pipeline and deploy across air-gapped (simulated) environment in Red Hat Labs 
  * Deploy to VMC (AWS) 
* Develop two features for CR18-22 & Exercise CI/CD pipeline
  * Develop 2 features in Microservcies
  * Run through CI/CD pipeline and deploy across air-gapped (simulated) environment 
  * Deploy to VMWare Cloud


## Running Locally
1. Start MySQL Docker container `docker-compose up`
1. Set environment variables
   * `export RAILS_SECRETS_YAML=${PWD}/config/secrets.yml`
   * `export RAILS_CONFIG_ENVIRONMENTS=${PWD}/config/environments`
   * `export RAILS_DB_YAML=${PWD}/config/database.yml`
1. Run `./bin/rake db:migrate`
1. Start server `./bin/rails server`