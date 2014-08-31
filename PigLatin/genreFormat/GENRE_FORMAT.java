import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.pig.EvalFunc;
import org.apache.pig.backend.executionengine.ExecException;
import org.apache.pig.data.Tuple;

public class GENRE_FORMAT extends EvalFunc<String> {

	@Override
	public String exec(Tuple input) {
		try {
			if (input == null || input.size() == 0) {
				return null;
			}

			String string_input = (String) input.get(0);
			String[] genre = string_input.split("\\|");
			int i = 0;
			String genre_Format = "";
			if (genre.length == 1) {
				genre_Format = genre[0];
			} else {
				while (i < genre.length) {
					if (i < genre.length - 1) {
						genre_Format = genre_Format + genre[i] + ", ";
					} else {
						genre_Format = genre_Format + "And " + genre[i];
					}
					i++;
				}
			}
			string_input = genre_Format;
			return string_input;
		} catch (ExecException ex) {
			System.out.println("Error: " + ex.toString());
		}
		return null;
	}
}