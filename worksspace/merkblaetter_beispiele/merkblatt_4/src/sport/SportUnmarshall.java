package sport;

import java.io.File;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;

import sport.jaxb.EventType;
import sport.jaxb.SportEvents;

public class SportUnmarshall {

	public static void main(String[] args) throws Exception  {
		JAXBContext context = JAXBContext.newInstance("sport.jaxb");
		Unmarshaller unmarshaller = context.createUnmarshaller();
		SportEvents events = (SportEvents) unmarshaller.unmarshal(new File("sport-events.xml"));

		System.out.println("Sportereignisse in " + events.getCity());
		for (EventType event : events.getEvent()) {
			System.out.println( event.getName() );
		}
	}

}
