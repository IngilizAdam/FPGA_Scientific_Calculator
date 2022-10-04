import java.io.*;

public class sinLookup {

    public static void main(String[] args) {
        PrintStream print = null;
        try {
            print = new PrintStream(new FileOutputStream("SinLookup.txt"));
        } catch (Exception e) {

        }
        for (int i = 0; i < 91; i++) {

            int sin = (int)( (10000*Math.toRadians(i)) - (10000*(Math.toRadians(i)*Math.toRadians(i)*Math.toRadians(i)))/6 +  (10000*(Math.toRadians(i)*Math.toRadians(i)*Math.toRadians(i)*Math.toRadians(i)*Math.toRadians(i)))/120);

            System.out.println(i + " - " + sin);
            if (i == 0) {
                print.println("if(yeniSayi == 0) begin");
                print.println("            sonuc = 0;");
                print.println("            sonuc1 = 0;");
                print.println("            sonuc2 = 0;");
                print.println("        end");
            } else {
                print.println("        else if(yeniSayi == " + i + ") begin");
                print.println("            sonuc = " + sin/10000 + ";");
                print.println("            sonuc1 = " + (sin/1000)%10 + ";");
                print.println("            sonuc2 = " + (sin/100)%10 + ";");
                print.println("        end");
            }
        }
    }

}
