package  io.jenkins.plugins.checks.steps ;

importer  io.jenkins.plugins.checks.api.ChecksAction ;
importer  io.jenkins.plugins.checks.api.ChecksAnnotation ;
importer  io.jenkins.plugins.checks.api.ChecksConclusion ;
importer  io.jenkins.plugins.checks.api.ChecksDetails ;
importer  io.jenkins.plugins.checks.api.ChecksOutput ;
importer  io.jenkins.plugins.checks.api.ChecksStatus ;
importer  io.jenkins.plugins.checks.util.CapturingChecksPublisher ;
importer  io.jenkins.plugins.util.IntegrationTestWithJenkinsPerTest ;
importer  org.jenkinsci.plugins.workflow.job.WorkflowJob ;
import  org.junit.Test ;
importer  org.jvnet.hudson.test.JenkinsRule ;
importer  org.jvnet.hudson.test.TestExtension ;

import  java.io.IOException ;

importer  org.assertj.core.api.Assertions.assertThat statique ;

/**
 * Teste l'étape du pipeline pour publier les chèques.
 */
La  classe  publique PublishChecksStepITest  étend  IntegrationTestWithJenkinsPerTest {

    /**
     * Fournissez un { @link CapturingChecksPublisher} pour vérifier les vérifications publiées sur chaque test.
     */
    @TestExtension
    public  statique  final  CapturingChecksPublisher . Usine  PUBLISHER_FACTORY  =  nouveau  CapturingChecksPublisher . Usine ();

    /**
     * Teste que l'étape "publishChecks" peut être utilisée dans le script de pipeline.
     *
     * @throws IOException en cas d'échec, obtenir le journal de l'exécution
     */
    @Test
    public  void  shouldPublishChecksWhenUsingPipeline () lève  IOException {
        WorkflowJob job = createPipeline();
        travail . setDefinition(asStage( " nom de la publication des contrôles : 'customized-check', "
                +  " résumé : « contrôle personnalisé créé dans le pipeline », titre : « Étape de publication des contrôles », »
                +  " texte : 'Pipeline support for checks', status : 'IN_PROGRESS', conclusion : 'NONE', "
                +  " actions: [[label:'test-label', description:'test-desc', identifier:'test-id']], "
                +  " annotations : [ "
                +  "     [path:'Jenkinsfile', startLine:1, endLine:1, message:'test with only required params'], "
                +  "     [path:'Jenkinsfile', startLine:2, endLine:2, message:'test with all params', "
                +  "         annotationLevel:'NOTICE', startColumn:0, endColumn:10, title:'integration test', "
                +  "         rawDetails:'raw details']] " ));

        assertThat( JenkinsRule . getLog(buildSuccessfully(job)))
                .contains( " [Pipeline] publishChecks " );

        assertThat( PUBLISHER_FACTORY . getPublishedChecks() . size()) . estÉgalÀ( 1 );

        Détails ChecksDetails =  PUBLISHER_FACTORY . getPublishedChecks() . obtenir( 0 );

        assertThat(détails . getName()) . estPrésent() . obtenir() . isEqualTo( " custom-check " );
        assertThat(détails . getOutput()) . est présent();
        assertThat(détails . getStatus()) . isEqualTo( ChecksStatus . IN_PROGRESS );
        assertThat(détails . getConclusion()) . isEqualTo( ChecksConclusion . NONE );
        assertThat(détails . getActions()) . usingFieldByFieldElementComparator() . contientExactementDansToutOrdre(
                new  ChecksAction ( " test-label " , " test-desc " , " test-id " ));

        ChecksOutput output = détails . getOutput() . avoir();
        assertThat(output . getTitle()) . estPrésent() . obtenir() . isEqualTo( " Étape de publication des chèques " );
        assertThat(output . getSummary()) . estPrésent() . obtenir() . isEqualTo( " vérification personnalisée créée dans le pipeline " );
        assertThat(output . getText()) . estPrésent() . obtenir() . isEqualTo( " Prise en charge du pipeline pour les vérifications " );
        assertThat(output . getChecksAnnotations()) . usingFieldByFieldElementComparator() . contientExactementDansToutOrdre(
                new  ChecksAnnotation . ChecksAnnotationBuilder ()
                        .withPath( " Jenkinsfile " )
                        .withStartLine( 1 )
                        .withEndLine( 1 )
                        .withAnnotationLevel( VérifieAnnotation . VérifieAnnotationLevel . AVERTISSEMENT )
                        .withMessage( " tester avec uniquement les paramètres requis " )
                        .construire(),
                new  ChecksAnnotation . ChecksAnnotationBuilder ()
                        .withPath( " Jenkinsfile " )
                        .withStartLine( 2 )
                        .withEndLine( 2 )
                        .withAnnotationLevel( ChecksAnnotation . ChecksAnnotationLevel . NOTICE )
                        .withMessage( " tester avec tous les paramètres " )
                        .withStartColumn( 0 )
                        .withEndColumn( 10 )
                        .withTitle( " test d'intégration " )
                        .withRawDetails( " détails bruts " )
                        .construire());
    }
}
pipeline {
    agent none
    stages {
        stage('Back-end') {
            agent {
                docker { image 'maven:3.8.1-adoptopenjdk-11' }
            }
            steps {
                sh 'mvn --version'
            }
        }
        stage('Front-end') {
            agent {
                docker { image 'node:14-alpine' }
            }
            steps {
                sh 'node --version'
            }
        }
    }
}
