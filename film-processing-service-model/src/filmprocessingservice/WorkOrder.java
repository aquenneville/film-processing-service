package filmprocessingservice;

import java.time.LocalDate;

public class WorkOrder {

	private long id;
    private Client client;
    private String notes;
    private String assigneeName;
    private int rollQuantity;
    private PaperSize paperSize;
    private PaperType paperType;    
    private int printQuantity;  
    private LocalDate date;
    private String envelopeUid;
    
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public Client getClient() {
		return client;
	}
	public void setClient(Client client) {
		this.client = client;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public String getAssigneeName() {
		return assigneeName;
	}
	public void setAssigneeName(String assigneeName) {
		this.assigneeName = assigneeName;
	}
	public int getRollQuantity() {
		return rollQuantity;
	}
	public void setRollQuantity(int rollQuantity) {
		this.rollQuantity = rollQuantity;
	}
	public PaperSize getPaperSize() {
		return paperSize;
	}
	public void setPaperSize(PaperSize paperSize) {
		this.paperSize = paperSize;
	}
	public PaperType getPaperType() {
		return paperType;
	}
	public void setPaperType(PaperType paperType) {
		this.paperType = paperType;
	}
	public LocalDate getDate() {
		return date;
	}
	public void setDate(LocalDate date) {
		this.date = date;
	}
	public int getPrintQuantity() {
		return printQuantity;
	}
	public void setPrintQuantity(int printQuantity) {
		this.printQuantity = printQuantity;
	}
	public String getEnvelopeUid() {
		return envelopeUid;
	}
	public void setEnvelopeUid(String envelopeUid) {
		this.envelopeUid = envelopeUid;
	}
    
}
