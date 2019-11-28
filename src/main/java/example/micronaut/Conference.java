package example.micronaut;

import io.micronaut.core.annotation.Introspected;

@Introspected
public class Conference {

    private String name;

    public Conference(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
