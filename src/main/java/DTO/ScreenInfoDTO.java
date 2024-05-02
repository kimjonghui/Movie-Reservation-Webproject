package DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ScreenInfoDTO {
	private String theaterName;
	private int screenNumber;
	private String title;
	private String size;
}
