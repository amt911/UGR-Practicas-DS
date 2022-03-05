import java.util.Observable;
import java.util.Random;

public class Temperatura extends Observable {
	private float _temp;

	public float getTemp() {
		return this._temp;
	}

	public void setTemp(float aTemp) {
		Random r = new Random();
                _temp = (50 - 20)*r.nextFloat() -15;
                setChanged();
                notifyObservers();
	}
}