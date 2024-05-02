package DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class boardDTO {
	private int no;
	private String Id;
	private String title;
	private String date;
	private String postwritten; // 작성 글

	public boardDTO(String id, String title, String date, String postwritten) {
		Id = id;
		this.title = title;
		this.date = date;
		this.postwritten = postwritten;
	}
}
