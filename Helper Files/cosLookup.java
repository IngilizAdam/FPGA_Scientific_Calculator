import java.io.*;

public class cosLookup {

    public static void main(String[] args) {
        PrintStream print = null;
        try {
            print = new PrintStream(new FileOutputStream("CosLookup.txt"));
        } catch (Exception e) {

        }
        for (int i = 0; i < 91; i++) {

            int cos = (int)( 10000 - (10000*(Math.toRadians(i))*(Math.toRadians(i)))/2 + (10000*(Math.toRadians(i))*(Math.toRadians(i))*(Math.toRadians(i))*(Math.toRadians(i)))/24 - (10000*(Math.toRadians(i))*(Math.toRadians(i))*(Math.toRadians(i))*(Math.toRadians(i))*(Math.toRadians(i))*(Math.toRadians(i)))/720 );
            if(cos == -8) cos = 0;
            System.out.println(i + " - " + cos);
            if (i == 0) {
                print.println("if(yeniSayi == 0) begin");
                print.println("            sonuc = 1;");
                print.println("            sonuc1 = 0;");
                print.println("            sonuc2 = 0;");
                print.println("        end");
            } else {
                print.println("        else if(yeniSayi == " + i + ") begin");
                print.println("            sonuc = " + cos/10000 + ";");
                print.println("            sonuc1 = " + (cos/1000)%10 + ";");
                print.println("            sonuc2 = " + (cos/100)%10 + ";");
                print.println("        end");
            }
        }
    }

}
