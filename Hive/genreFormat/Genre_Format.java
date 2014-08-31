
import org.apache.hadoop.hive.ql.exec.UDF;
import org.apache.hadoop.io.Text;

public class Genre_Format extends UDF {
	public Text evaluate(Text genre)
	{
		StringBuilder final_String = new StringBuilder();
		String[] split_Genre =  genre.toString().split("\\|");
		final_String.append(split_Genre[0]);
		if (split_Genre.length>1)
		{
			for (int i=1;i < split_Genre.length;i++)
			{
				final_String.append(", ");
				if (i == split_Genre.length - 1)
					final_String.append("and ");
				final_String.append(split_Genre[i]);
			}
			
		}
		return new Text(final_String.toString());
	}
}
