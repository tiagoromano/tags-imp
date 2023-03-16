package blockly;

import cronapi.*;
import cronapi.rest.security.CronappSecurity;
import java.util.concurrent.Callable;



@CronapiMetaData(type = "blockly")
@CronappSecurity
public class Bloco {

public static final int TIMEOUT = 300;

/**
 *
 * Bloco
 *
 * @param x
 *
 * @author Root
 * @since 15/03/2023, 17:08:41
 *
 */
public static Var Executar(@ParamMetaData(description = "x", id = "51c0d24b") Var x) throws Exception {
 return new Callable<Var>() {

   public Var call() throws Exception {
    System.out.println(
    Var.valueOf("chamou").getObjectAsString());
    System.out.println(x.getObjectAsString());
    return
Var.valueOf("oxe");
   }
 }.call();
}

}

