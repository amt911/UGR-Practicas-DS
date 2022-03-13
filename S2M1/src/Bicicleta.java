public abstract class Bicicleta implements Runnable{
        protected int dorsal;
        protected boolean acabado;
        
        public Bicicleta(int dorsal, boolean tengoAcabar){
                this.dorsal = dorsal;
                acabado=tengoAcabar;
        }
	abstract void acabarCarrera();
}