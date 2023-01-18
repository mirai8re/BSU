package anna.data.decorator;

import anna.data.IData;

import java.io.IOException;

public class IDataDecorator implements IData {
    private IData data;

    public IDataDecorator(IData source) {
        this.data = source;
    }

    @Override
    public String readData() throws IOException {
        return data.readData();
    }

    @Override
    public void writeData(String source) {
        data.writeData(source);
    }
}
