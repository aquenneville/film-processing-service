package filmprocessingservice;

public class Invoice {

	private long id;
    private WorkOrder workOrder;
    private float amount;
    
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public WorkOrder getWorkOrder() {
		return workOrder;
	}
	public void setWorkOrder(WorkOrder workOrder) {
		this.workOrder = workOrder;
	}
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
	}    
}
