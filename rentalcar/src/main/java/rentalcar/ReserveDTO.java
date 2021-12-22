package rentalcar;

//reserve_seq no id cnt days r_day use_navi use_seat
public class ReserveDTO {
	private int reserve_seq, no, cnt, days, use_navi, use_seat;
	private String id, r_day;
	
	public ReserveDTO(int reserve_seq, int no, String id, int cnt, int days, String r_day, int use_navi, int use_seat) {
		this.reserve_seq = reserve_seq;
		this.no = no;
		this.id = id;
		this.cnt = cnt;
		this.days = days;
		this.r_day = r_day;
		this.use_navi = use_navi;
		this.use_seat = use_seat;
	}
	
	public ReserveDTO(int no, String id, int cnt, int days, String r_day, int use_navi, int use_seat) {
		this.no = no;
		this.id = id;
		this.cnt = cnt;
		this.days = days;
		this.r_day = r_day;
		this.use_navi = use_navi;
		this.use_seat = use_seat;
	}
	
	public int getReserve_seq() {
		return reserve_seq;
	}

	public int getNo() {
		return no;
	}

	public int getCnt() {
		return cnt;
	}
	
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	public int getDays() {
		return days;
	}
	
	public void setDays(int days) {
		this.days = days;
	}
	
	public int getUse_navi() {
		return use_navi;
	}
	
	public void setUse_navi(int use_navi) {
		this.use_navi = use_navi;
	}
	
	public int getUse_seat() {
		return use_seat;
	}
	
	public void setUse_seat(int use_seat) {
		this.use_seat = use_seat;
	}
	
	public String getId() {
		return id;
	}
	
	public String getR_day() {
		return r_day;
	}
	
	public void setR_day(String r_day) {
		this.r_day = r_day;
	}
}
