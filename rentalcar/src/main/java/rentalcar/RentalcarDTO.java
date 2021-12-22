package rentalcar;

//no name category price use_people company img info

public class RentalcarDTO {
	private String name, company, img, info;
	private int no, category,price,use_people;

	public RentalcarDTO(int no, String name, int category, int price, int use_people, String company, String img, String info) {
		this.no = no;
		this.name = name;
		this.category = category;
		this.price = price;
		this.use_people = use_people;
		this.company = company;
		this.img = img;
		this.info = info;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getUse_people() {
		return use_people;
	}

	public void setUse_people(int use_people) {
		this.use_people = use_people;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getNo() {
		return no;
	}
}
