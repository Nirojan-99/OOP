package model;


import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class PriceDetails {
	
	public HashMap<String,Double> photography = new HashMap<>();
	public HashMap<String,Double> catering = new HashMap<>();
	public HashMap<String,Double> electric = new HashMap<>();
	public HashMap<String,Double> flower = new HashMap<>();
	
	public PriceDetails() {
		photography.put("Clasic",50.00);
		photography.put("Deluxe",70.00);
		photography.put("Modern",80.00);
		photography.put("Golden",90.00);
		photography.put("Ultimate",95.00);
		photography.put("No need",0.00);
		
		catering.put("Veg",50.00);
		catering.put("Non Veg",70.00);
		catering.put("Continental",80.00);
		catering.put("Orental",95.00);
		catering.put("Chinese",75.00);
		catering.put("No need",0.00);
		
		electric.put("Chandeliers",50.00);
		electric.put("Wall sconees",70.00);
		electric.put("Clasic",80.00);
		electric.put("Basic",95.00);
		electric.put("pendant lighting",75.00);
		electric.put("No need",0.00);
		
		flower.put("Basic",50.00);
		flower.put("Fully Natural",70.00);
		flower.put("Botanical Theme",80.00);
		flower.put("Crescent Corsage",95.00);
		flower.put("Nosegay Corsage",75.00);
		flower.put("No need",0.00);
	}
	
	
	public double returnTotal(event ev) {
		
		double total = 0.00;
		
		Set<Map.Entry<String, Double>> set1 = photography.entrySet();
		
		for(Map.Entry<String, Double> value : set1) {
			
			if(ev.getPhotography().equals(value.getKey())) {
				total += value.getValue();
			}
			
		}
		
		Set<Map.Entry<String, Double>> set2 = catering.entrySet();
		
		for(Map.Entry<String, Double> value : set2) {
			
			if(ev.getCatering().equals(value.getKey())) {
				total += value.getValue();
			}
			
		}
		
		Set<Map.Entry<String, Double>> set3 = electric.entrySet();
		
		for(Map.Entry<String, Double> value : set3) {
			
			if(ev.getElectric_decoration().equals(value.getKey())) {
				total += value.getValue();
			}
			
		}
		
		Set<Map.Entry<String, Double>> set4 = flower.entrySet();
		
		for(Map.Entry<String, Double> value : set4) {
			
			if(ev.getFlower_decoration().equals(value.getKey())) {
				total += value.getValue();
			}
			
		}

		return total;
	}
	
	
}
