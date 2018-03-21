package filmprocessingservice;

public class WorkOrderResult {

	private long id;
    private WorkOrder workOrder;
    private int negativeQuantity;
    private int printTotal;
    
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
	public int getNegativeQuantity() {
		return negativeQuantity;
	}
	public void setNegativeQuantity(int negativeQuantity) {
		this.negativeQuantity = negativeQuantity;
	}
	public int getPrintTotal() {
		return printTotal;
	}
	public void setPrintTotal(int printTotal) {
		this.printTotal = printTotal;
	}
    
}
