import java.util.*;
import java.io.*;

public class Day4 {
	public static void solve(List<String> input) {
		int contains = 0;
		int overlaps = 0;
		for (String s : input) {
			String[] parts = s.split(",");
			String[] sec1Parts = parts[0].split("-");
			String[] sec2Parts = parts[1].split("-");
			int sec1Lower = Integer.parseInt(sec1Parts[0]);
			int sec1Upper = Integer.parseInt(sec1Parts[1]);
			int sec2Lower = Integer.parseInt(sec2Parts[0]);
			int sec2Upper = Integer.parseInt(sec2Parts[1]);

			// for part 1
			if (sec1Lower <= sec2Lower && sec1Upper >= sec2Upper)
				contains++;
			else if (sec1Lower >= sec2Lower && sec1Upper <= sec2Upper)
				contains++;

			// for part 2
			if((sec1Lower <= sec2Lower && sec1Upper >= sec2Lower) || (sec1Lower <=
						sec2Upper && sec1Upper >= sec2Upper))
				overlaps++;
			else if((sec2Lower <= sec1Lower && sec2Upper >= sec1Lower) || (sec2Lower
						<= sec1Upper && sec2Upper >= sec1Upper))
				overlaps++;

		}
		System.out.println(contains);
		System.out.println(overlaps);
	}

	public static void main(String[] args) throws IOException {
		File inputFile = new File("input.txt");
		Scanner fileInput = new Scanner(inputFile);
		List<String> fileContents = new ArrayList<>();
		while (fileInput.hasNext())
			fileContents.add(fileInput.next());
		fileInput.close();
		solve(fileContents);
	}
}
