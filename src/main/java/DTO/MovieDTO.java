package DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MovieDTO {
	private String title;
	private String director;
	private String actor;
	private String story;
	private String runtime;
	private String rating;
	private String genre;
	private String imageURL;
}
