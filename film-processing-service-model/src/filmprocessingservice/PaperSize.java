package filmprocessingservice;

public class PaperSize {

	private long id;
    private String sizeInInches;
    private String sizeInCm;
	
    public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getSizeInInches() {
		return sizeInInches;
	}
	public void setSizeInInches(String sizeInInches) {
		this.sizeInInches = sizeInInches;
	}
	public String getSizeInCm() {
		return sizeInCm;
	}
	public void setSizeInCm(String sizeInCm) {
		this.sizeInCm = sizeInCm;
	}
        
}
