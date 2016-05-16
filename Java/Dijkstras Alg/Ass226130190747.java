/* Name: Wilford Engel
 * Student Number: 130190747
 * Date: 08/03/2015
 */

//package coursework; // COMMENT OUT

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;
import java.util.TreeMap;

public class Ass226130190747 {
    //
    private static int N = 308; // Number of edges
    private static double [][] edges = new double[N][N];
    private static double [][] edgeDistances = new double[N][N];
    private static double [][] ranEdges;
    private static double [] latitude = new double[N];
    private static double [] longitude = new double[N];
    private static double [][] stationDistances = new double[N][N];
    private static double [][] crow = new double[N][N];
    private static TreeMap <Integer,String> stations = new TreeMap<Integer,String>();
    private static ArrayList<pair> mostShortPaths;
    private static ArrayList<pair> longestShortPaths;
    private static ArrayList<pair> closestDis;
    private static ArrayList<pair> furthestDis;
    private static ArrayList<pair> biggestDif;
    private static graph G, D, R;
    
    public Ass226130190747() throws FileNotFoundException {
        G = new graph(edges);
        D = new graph(edgeDistances);
        R = new graph(ranEdges);
        testAllPairs();       
    }
    
    public static int getNumShortPaths(int start, int end) {
        return G.shortestPaths(start, end).size();
    }
    
    public static int getLengthShortPath(int start, int end) {
        return firstElement(G.shortestPaths(start, end)).size();

    }
    
    @SuppressWarnings("unchecked")
    public static ArrayList<Integer> firstElement(HashSet<ArrayList<Integer>> s) {
        return (ArrayList<Integer>)s.toArray()[0];
    }
    
    // test all station pairs only ONCE to reduce computation strain
    public void testAllPairs() {
        mostShortPaths = new ArrayList<pair>();
        longestShortPaths = new ArrayList<pair>();
        int most = 0;
        int longest = 0;
        double min = Double.POSITIVE_INFINITY;
        double max = 0.0;
        double maxDif = 0.0;
        furthestDis = new ArrayList<pair>();
        closestDis = new ArrayList<pair>();
        biggestDif = new ArrayList<pair>();
        for (int i = 1; i < N-1; i++)
            for (int j = i + 1; j < N; j++) {              
                HashSet<ArrayList<Integer>> testPair = new HashSet<ArrayList<Integer>>();
                testPair = G.shortestPaths(i, j);
                int x = testPair.size();
                int y = 0;
                if (!testPair.isEmpty())
                    y = firstElement(testPair).size();
                if (x > most) {
                    most = x;
                    mostShortPaths.clear();
                    mostShortPaths.add(new pair(i,j));
                }
                else if (x == most) {
                    mostShortPaths.add(new pair(i, j));
                }
                if (y > longest) {
                    longest = y;
                    longestShortPaths.clear();
                    longestShortPaths.add(new pair(i,j));
                }
                else if (y == longest) {
                    longestShortPaths.add(new pair(i,j));
                }
                
                // find the distance of all stations that are adjacent. Dijkstra or shortestPaths irrelevant
                if (edges[i][j] == 1.0) {
                    stationDistances[i][j] = realDistance(latitude[i], longitude[i], latitude[j], longitude[j]);
                    if (stationDistances[i][j] < min) {
                        closestDis.clear();
                        closestDis.add(new pair(i,j));
                        min = stationDistances[i][j];
                    }
                }
                // use dijkstra to test the distances between station pairs
                else if (i != j) {
                    stationDistances[i][j] = sumDistance(D.dijkstra(i,j));
                    crow[i][j] = realDistance(latitude[i], longitude[i], latitude[j], longitude[j]);
                    if (stationDistances[i][j] > max) {
                        furthestDis.clear();
                        furthestDis.add(new pair (i,j));
                        max = stationDistances[i][j];
                    }
                    if ((stationDistances[i][j] - crow[i][j]) > maxDif) {
                        biggestDif.clear();
                        biggestDif.add(new pair(i,j));
                        maxDif = stationDistances[i][j] - crow[i][j];
                    }
                }
            }
    }
    
    public static double sumWeight(int start, int end) {
        ArrayList<Integer> toSum = R.dijkstra(start, end);
        double sum = 0.0;
        for (int i = 0; i < toSum.size() - 1; i++) {
            sum = sum + ranEdges[toSum.get(i)][toSum.get(i+1)];
        }
        return sum;
    }

    public static double realDistance(double lat1, double lon1, double lat2, double lon2) {
        int R = 6371;
        double dLat = (lat2-lat1) * Math.PI / 180;
        double dLon = (lon2-lon1) * Math.PI / 180;
        double a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(lat1 * Math.PI / 180) * 
                Math.cos(lat2 * Math.PI / 180) * Math.sin(dLon/2) * Math.sin(dLon/2);
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
        double d = R * c;
        return d;
    }
    
    public static double sumDistance(ArrayList<Integer> path) {
      double d = 0.0;
      double min = Double.POSITIVE_INFINITY;
          for (int j = 0; j < path.size() - 1; j++)
              d = d + realDistance(latitude[path.get(j)], longitude[path.get(j)], latitude[path.get(j+1)], longitude[path.get(j+1)]);
          if (d < min)
          min = d;
      return min;
    }
    
    public class pair {
        int a, b;
        pair (int a, int b){
            this.a = a;
            this.b = b;
        }
    }

    public class graph {
        double [][] adj;
        graph (double [][] a) {
            adj= new double [a.length][a.length];
            for (int i=0;i<a.length;i++)
                for (int j=0;j<a.length;j++) {
                    adj[i][j]=a[i][j];
                }
        }
        
        public HashSet <Integer> neighbours(int v) {
            HashSet <Integer> h = new HashSet <Integer> () ;
            for (int i=0;i<adj.length;i++) 
                if (adj[v][i]!=0) h.add(i);
            return h;
        }
        
        @SuppressWarnings("unchecked")
        ArrayList <Integer> addToEnd (int i, ArrayList <Integer> path) {// returns a new path with i at the end of path
            ArrayList <Integer> k;
            k=(ArrayList<Integer>)path.clone();
            k.add(i);
            return k;
        }
        
        @SuppressWarnings("unchecked")
        public HashSet <ArrayList <Integer>> shortestPaths1(HashSet <ArrayList<Integer>> sofar, HashSet <Integer> visited, int end) {
            HashSet <ArrayList <Integer>> more = new HashSet <ArrayList<Integer>>();
            HashSet <ArrayList <Integer>> result = new HashSet <ArrayList<Integer>>();
            HashSet <Integer> newVisited = (HashSet <Integer>) visited.clone();
            boolean done = false;
            boolean carryon = false;
            for (ArrayList <Integer> p: sofar) {
                for (Integer z: neighbours(p.get(p.size()-1))) {
                    if (!visited.contains(z)) {
                        carryon=true;
                        newVisited.add(z);
                        if (z==end) {
                            done=true; 
                            result.add(addToEnd(z,p));
                        }
                        else more.add(addToEnd(z,p));
                    }
                }
            }
            if (done) 
                return result;
            else if (carryon) 
                return shortestPaths1(more,newVisited,end);
            else 
                return new HashSet <ArrayList <Integer>>();
        }
        
        public HashSet <ArrayList <Integer>> shortestPaths(int first, int end) {
            HashSet <ArrayList <Integer>> sofar = new HashSet <ArrayList<Integer>>();
            HashSet <Integer> visited = new HashSet <Integer>();
            ArrayList <Integer> starting = new ArrayList <Integer>();
            starting.add(first);
            sofar.add(starting);
            if (first==end) 
                return sofar;
            visited.add(first);
            return shortestPaths1(sofar,visited,end);
        }
        
        int findSmallest(HashMap<Integer, Double> t) {
            Object[] things = t.keySet().toArray();
            double val = t.get(things[0]);
            int least = (int) things[0];
            Set <Integer> k = t.keySet();
            for (Integer i : k) {
                if (t.get(i) < val) {
                    least = i; val = t.get(i);
                }
            }
            return least;
        }
        
        @SuppressWarnings("unchecked")
        public ArrayList<Integer> dijkstra(int start, int end) {
            int N = adj.length; 
            HashMap <Integer, Double> Q = new HashMap <Integer, Double>();
            ArrayList <Integer>[] paths = new ArrayList[N];
            for (int i = 0; i < N; i++) {
                Q.put(i, Double.POSITIVE_INFINITY);
                paths[i] = new ArrayList<Integer>();
                paths[i].add(start);
            }
            HashSet<Integer> S = new HashSet<Integer>();
            S.add(start);
            Q.put(start, 0.0);
            while (!Q.isEmpty()) {
                int v = findSmallest(Q);
                if (v == end && (Q.get(v) != Double.POSITIVE_INFINITY))
                    return paths[end];
                double w = Q.get(v);
                S.add(v);
                for (int u: neighbours(v)) {
                    if (!S.contains(u)) {
                        double wl = adj[v][u] + w;
                        if (wl < Q.get(u)) {
                            Q.put(u, wl);
                            paths[u] = addToEnd(u, paths[v]);
                        }
                    }
                }
                Q.remove(v);
            }
            return new ArrayList<Integer>();
        }
    }
    
    static void readFiles() throws FileNotFoundException {
        for(int i=0;i<N;i++)
            for(int j=0;j<N;j++) {
                edges[i][j]=0.0;
                edgeDistances[i][j] = 0.0;
                stationDistances[i][j] = 0.0;
            }
        int Z = 1000;
        ranEdges = new double[Z][Z];
        for(int i=0;i<Z;i++)
            for(int j=0;j<Z;j++) 
                ranEdges[i][j]=0.0;
        Scanner s = new Scanner(new FileReader("randomGraph"));
        String z = s.nextLine();
        while (s.hasNext()) {
            z = s.nextLine();
            String[] results = z.split(",");
            ranEdges[Integer.parseInt(results[0])][Integer.parseInt(results[1])] = Double.parseDouble(results[2]);
        }
        latitude[0] = 0.0;
        longitude[0] = 0.0;
        s = new Scanner(new FileReader("stations"));
        z = s.nextLine();
        while (s.hasNext()) {
            z = s.nextLine();
            String[] results = z.split(",");
            stations.put(Integer.parseInt(results[0]),results[3]);
            latitude[Integer.parseInt(results[0])] = Double.parseDouble(results[1]);
            longitude[Integer.parseInt(results[0])] = Double.parseDouble(results[2]);
        }
        s = new Scanner(new FileReader("edges"));
        z = s.nextLine();
        while (s.hasNext()) {
            z = s.nextLine();
            String[] results = z.split(",");
            int s1 = Integer.parseInt(results[0]);
            int s2 = Integer.parseInt(results[1]);
            edges[s1][s2] = 1.0;
            edges[s2][s1] = 1.0;
            edgeDistances[s1][s2] = realDistance(latitude[s1], longitude[s1], latitude[s2], longitude[s2]);
            edgeDistances[s2][s1] = realDistance(latitude[s2], longitude[s2], latitude[s1], longitude[s1]);        
        }
        s.close();
    }
    
    static void printResults() {
        System.out.println("Name: Wilford Engel");
        System.out.println("Student ID: 130190747\n");
        System.out.println("Question 1: " + getNumShortPaths(239, 268));
        System.out.println("Question 2: " + getNumShortPaths(1, 2));
        System.out.println("Question 3: " + getLengthShortPath(126, 128));
        System.out.print("Question 4: ");
        for (int i = 0; i< mostShortPaths.size(); i++) {
            System.out.print("\"" + stations.get(mostShortPaths.get(i).a) + "\"");
            System.out.println("\"" + stations.get(mostShortPaths.get(i).b) + "\"");
        }
        System.out.print("Question 5: ");
        for (int i = 0; i< longestShortPaths.size(); i++) {
            System.out.print("\"" + stations.get(longestShortPaths.get(i).a) + "\"");
            System.out.println(" \"" + stations.get(longestShortPaths.get(i).b) + "\"");
        }
        System.out.println("Question 6: " + getLengthShortPath(longestShortPaths.get(0).a, longestShortPaths.get(0).b));
        System.out.println("Question 7: " + R.dijkstra(72, 66).size());
        System.out.println("Question 8: " + sumWeight(72, 66));
        System.out.println("Question 9: " + sumDistance(D.dijkstra(1, 2)));
        System.out.print("Question 10: ");
        for (int i = 0; i< closestDis.size(); i++) {
            System.out.print("\"" + stations.get(closestDis.get(i).a) + "\"");
            System.out.println(" \"" + stations.get(closestDis.get(i).b) + "\"");
        }
        System.out.println("Question 11: " + stationDistances[closestDis.get(0).a][closestDis.get(0).b]);
        System.out.print("Question 12: ");
        for (int i = 0; i< furthestDis.size(); i++) {
            System.out.print("\"" + stations.get(furthestDis.get(i).a) + "\"");
            System.out.println(" \"" + stations.get(furthestDis.get(i).b) + "\"");
        }
        System.out.println("Question 13: " + stationDistances[furthestDis.get(0).a][furthestDis.get(0).b]);
        System.out.print("Question 14: ");
        for (int i = 0; i< biggestDif.size(); i++) {
            System.out.print("\"" + stations.get(biggestDif.get(i).a) + "\"");
            System.out.println(" \"" + stations.get(biggestDif.get(i).b) + "\"");
        }
        System.out.println("Question 15: " + (stationDistances[biggestDif.get(0).a][biggestDif.get(0).b] - crow[biggestDif.get(0).a][biggestDif.get(0).b]));
    }
    
    public static void main(String[] args) throws Exception{
        
        long startTime = System.nanoTime();
        
        readFiles();
        new Ass226130190747();
        
        printResults();
             
        System.out.print("\nExecution time for program: " + (System.nanoTime() - startTime) / 1000000 + " milliseconds");
    }
}