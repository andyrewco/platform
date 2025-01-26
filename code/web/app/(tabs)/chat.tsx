import { StyleSheet, Text } from "react-native";
import { SafeAreaView } from "react-native-safe-area-context";

export default function ChatScreen() {
  return (
    <SafeAreaView style={styles.bg}>
      <Text style={styles.text}>Not Implemented Yet</Text>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  bg: {
    height: "100%",
  },
  text: {
    fontWeight: "bold",
    color: "white",
  },
});
