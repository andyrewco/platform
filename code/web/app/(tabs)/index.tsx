import { StyleSheet, View, Text, SafeAreaView } from "react-native";
import { FAB } from "../../components/util/FAB";
import { IconSymbol } from "../../components/ui/IconSymbol";

export default function HomeScreen() {
  return (
    <SafeAreaView style={styles.background}>
      <Text>"this is a test</Text>
      <FAB
        color="#FFFFFF"
        onPress={() => {
          console.log("test");
        }}
        icon={<IconSymbol size={32} name="plus.app.fill" color={"#000000"} />}
      ></FAB>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  background: {
    height: "100%",
  },
});
