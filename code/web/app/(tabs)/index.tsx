import { StyleSheet, View, Text, SafeAreaView, ScrollView } from "react-native";
import { FAB } from "../../components/util/FAB";
import { IconSymbol } from "../../components/ui/IconSymbol";
import { padding } from "../../util/padding";

export default function HomeScreen() {
  return (
    <SafeAreaView>
      <ScrollView style={styles.background}>
      </ScrollView>

      <FAB
        color="#FFFFFF"
        onPress={() => {}}
        icon={<IconSymbol size={32} name="plus.app.fill" color={"#000000"} />}
      ></FAB>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  background: {
    height: "100%",
    ...padding(16, 16, 16, 16),
  },
  text: {
    color: "blue",
  },
});
