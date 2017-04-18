#!groovy​

node('Maven') {
	
	def mavenCommand = "mvn -s configuration/settings.xml"
	
	stage('Build') {
		git branch: 'master' url: ''
		sh "${mavenCommand} clean install -DskipTests=true"
	}
	
	stage('Test and Analysis') {
		parallel
	}
}