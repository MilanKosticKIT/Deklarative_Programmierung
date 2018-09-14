package sport;

import java.io.File;
import java.math.BigDecimal;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;
import javax.xml.datatype.DatatypeFactory;

import sport.jaxb.EventType;
import sport.jaxb.ObjectFactory;
import sport.jaxb.SportEvents;

public class SportMarshall {

	public static void main(String[] args) throws Exception  {
		ObjectFactory factory = new ObjectFactory();
		DatatypeFactory datatypeFactory = DatatypeFactory.newInstance();
		
		SportEvents events = factory.createSportEvents();
		events.setCity("Berlin");
		events.setVersion(new BigDecimal(1.5)) ;
		EventType event = factory.createEventType();
		event.setName("Marathon");
		event.setStart(datatypeFactory.newXMLGregorianCalendar("2017-09-24")); // 24.9.2017
		events.getEvent().add(event);
		
		JAXBContext context = JAXBContext.newInstance("sport.jaxb");
		Marshaller marshaller = context.createMarshaller();
		marshaller.marshal(events, new File("sport-events-from-java.xml"));
	}

}
