function fn() {
    var env = karate.env;// get system property 'karate.env'
    karate.log('karate.env system property was:', env);


    var config = {
        env: env,
        myVarName: 'hello karate to GSA',
        baseUrl: 'https://dev-esb.ocfo.gsa.gov/deva/gsa-fm-fleet-wps',
        cronToken: 'eyJhbGciOiJSUzI1NiIsImtpZCI6IjNtX3JkQXBPUFdVM181Z1RZbFRzSEkwSUdtbHVLU251UjRjbGlJUzNGSEEifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJzaGFyZWQiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlY3JldC5uYW1lIjoicmVhZC1vbmx5LXRva2VuLXY0cXR4Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZXJ2aWNlLWFjY291bnQubmFtZSI6InJlYWQtb25seSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6IjczYzJlYzgyLWNjZDgtNDY4Mi04YzBjLWU5Zjg1NzAzMGYxNyIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDpzaGFyZWQ6cmVhZC1vbmx5In0.p9jxv7WrGp4_tsEmxx3Ad1qPA8C4l43XSI_oL2PSSzbLG3sCeXidVQM5zz7ghx9fHeMgUYPVDozeY33zoAo6_OYa17TpP7k8SkrqQnsnmwZPZXtje7Lej2pisQ3K5u5WHRpXAVgbfMx2fkn7_7uhoG38e2vmi5hThA4rnlF-lNXbCQLscMGUzGjooS472z6fyZEv7a37gfad_G6YNZV_XD2rXeqNrfiYvr2S78ZI9kS6X9uH3vPc9h4eFki4o59xgZ_pR9MV2UA0coJ6z3cBXEuojjnthXLxBqMyxTrzHXgJTBERQ40S6j3hYwXRO7U_T-ud07d8ahr-fWXRu9LVAA',
        login: 'fleet_user',
        password: 'bS9AMRKfbC'

    }

    if(env == 'qa'){
    config.baseUrl = 'https://test-esb.ocfo.gsa.gov/testa/gsa-fm-fleet-wps'
    }
    else if(env == 'dev'){
        config.baseUrl = 'https://dev-esb.ocfo.gsa.gov/deva/gsa-fm-fleet-wps'
    }
    else {
    config.baseUrl = 'https://dev-esb.ocfo.gsa.gov/deva/gsa-fm-fleet-wps'
    }




    return config;
    }
