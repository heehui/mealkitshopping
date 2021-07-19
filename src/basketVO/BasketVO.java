package basketVO;

public class BasketVO {
	private int cart_id;
	private String user_id;
	private String p_image;//제품 이미지
	private String p_name;//제품명
	private int price;//가격
	private int cnt;//수량
	private int one_total;
	//private int all_total;
	
	
	public BasketVO() { }
	
	public BasketVO(int cart_id, String user_id,String p_image, String p_name, int price,int cnt,int one_total) { 
		this.cart_id = cart_id;
		this.user_id = user_id;
		this.p_image = p_image;
		this.p_name = p_name;
		this.price = price;
		this.cnt = cnt;
		this.one_total = one_total;

	}
	
	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getP_image() {
		return p_image;
	}
	public void setP_image(String p_image) {
		this.p_image = p_image;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getCart_id() {
		return cart_id;
	}

	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}

	public int getOne_total() {
		return one_total;
	}

	public void setOne_total(int one_total) {
		this.one_total = one_total;
	}


}
