# Panusin Sinthon SauceDeme


### Install Library with python interpreter
```
pip install PyYAML
pip install robotframework
pip install selenium
```
### Before run test
> Please download and save chromedriver that satisfied your Chrome version into your project directory
> https://chromedriver.chromium.org/downloads/version-selection

### Argument
#### this argument is the example when the product has test environment before production and it is required when giving robot command
> -v ar_ENVIRONMENT: STAGING

###  Run test
#### this example will run all the test files under TestCases directory with tag name: regression
```
robot -v ar_ENVIRONMENT:STAGING -i regression -d Output TestCases/*.robot

```
