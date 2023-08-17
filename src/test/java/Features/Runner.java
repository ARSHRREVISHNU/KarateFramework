package Features;

import com.intuit.karate.junit5.Karate;

//@RunWith(Karate.class)
public class Runner {

    @Karate.Test
    Karate testUi() {
        return Karate.run("src/test/java/Features/APITest.feature");
                //.tags("ReqresGET");
    }

    @Karate.Test
    Karate orchestration(){
        return Karate.run("src/test/java/Features/Orchestration/Orchestration.feature");
    }

    @Karate.Test
    Karate apiTest2(){
        return Karate.run("src/test/java/Features/APITest2.feature");
    }

}

