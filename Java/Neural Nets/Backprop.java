public class Backprop {

 //initialize inputs
 //static int x1,x2,x3,x4;
 static double[][] input = {{0,0},{0,1},{1,0},{1,1}};
 static int[] target = {0,1,1,0};
 
 //initialize weights
 static double wa1,wb1,wa2,wb2,wu,wv;
 
 //output
 static double u,v,o;
 
 //initializing errors
 static double error;
 //initializing bias
 static double b1,b2,b3;
 
 //learning rate
 static double learningRate=0.1;
 static int count = 0;
 static int maxCount = 500;
 static boolean loop = true;
 public static void main(String[] args) {
 //initialize weights
 wa1 =0.4;
 wb1 =0.4;
 wa2 =0.4;
 wb2 =0.4;
 wu =0.4;
 wv =0.4;

 //initialize bias
 b1 = 0.2;
 b2 = 0.5;
 b3 = 0.6;
 
 //System.out.println(b5);
 while(loop){
 
 for(int i=0;i<input.length;i++){
	 calculateActivations(input[i][0], input[i][1]);
	 calculateDelta(i);
	 calculateNewWeights(i);
	 calculateNewBias();
	 count++;
 
//  System.out.println(y4 + ", "+ y5);
 }
 
 if(count>=maxCount){
 	loop = false;
 }
 }
 
}
 static void calculateActivations(double x1,double x2){
	 u = sigmoid((x1*wa1)+(x2*wb1)+b1);
	 v = sigmoid((x1*wa2)+(x2*wb2)+b2);
	 o = sigmoid((u*wu)+(v*wv)+b3);
	 //return y4;
 }
 
static void calculateError(int j){
 	error = target[j] - o;
 }
 
 private static void calculateNewWeights(){
 wa += (learningRate*error*input[0]*u*(1-u));
 wb += (learningRate*error*input[j]*y1*(1-y1));
 w7 += (learningRate*delta1*input[j][2]*y1*(1-y1));
 w10 += (learningRate*delta1*input[j][3]*y1*(1-y1));
 
}
 private static void calculateNewBias(){
 b1 += delta1;
 b2 +=delta2;
 b3 +=delta3;
 b4 +=delta4;
 b5 +=delta5;
 }
 static double sigmoid(double exponent){
 return (1.0/(1+Math.pow(Math.E,(-1)*exponent)));
 }
}