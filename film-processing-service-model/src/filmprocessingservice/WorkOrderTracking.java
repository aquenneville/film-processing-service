package filmprocessingservice;

import java.time.LocalDate;

public class WorkOrderTracking {

	private long id;
    private WorkOrder workOrder;
    private WorkOrderState workOrderState;
    private LocalDate stateChanged;
    
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
	public WorkOrderState getWorkOrderState() {
		return workOrderState;
	}
	public void setWorkOrderState(WorkOrderState workOrderState) {
		this.workOrderState = workOrderState;
	}
	public LocalDate getStateChanged() {
		return stateChanged;
	}
	public void setStateChanged(LocalDate stateChanged) {
		this.stateChanged = stateChanged;
	}
	
}
