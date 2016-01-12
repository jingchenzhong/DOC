import android.app.Activity;
import android.content.Context;
import android.joffee.JoffeeManager;

public class MainActivity extends Activity {
private JoffeeManager joffeeManager;

@Override
protected void onCreate(Bundle savedInstanceState) {
super.onCreate(savedInstanceState);
setContentView(R.layout.activity_main);

joffeeManager = getSystemService(JOFFEE_SERVICE);

 joffeeManager.callJoffeeMethod();
}

}