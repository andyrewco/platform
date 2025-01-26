import {
  Pressable,
  SafeAreaView,
  StyleSheet,
  View,
  Text,
  Dimensions,
} from "react-native";
import { PressableScale } from "../../lib/custom-animations/PressableScale";
import { padding } from "../../util/padding";
import { AuthStatus, useAuthStore } from "../../lib/state/auth";
import { navigate } from "expo-router/build/global-state/routing";
import { router } from "expo-router";

export default function ProfileScreen() {
  const authStatus = useAuthStore((state) => state.authStatus);
  const login = useAuthStore((state) => state.login);
  const logout = useAuthStore((state) => state.logout);

  const isLoggedIn = () => authStatus == AuthStatus.authenticated;

  return (
    <SafeAreaView style={sytles.bg}>
      <Text style={sytles.text}>{authStatus.toString()}</Text>
      {isLoggedIn() ? (
        <LogoutButton press={logout} text={"Logout"} />
      ) : (
        <LoginButton press={login} text={"Login to BlueSky"} />
      )}
    </SafeAreaView>
  );
}

function LogoutButton(props: { press: () => void; text: string }) {
  return (
    <PressableScale style={sytles.logoutButton} onPress={props.press}>
      <View>
        <Text style={sytles.logoutButtonTxt}>{props.text}</Text>
      </View>
    </PressableScale>
  );
}

function LoginButton(props: { press: () => void; text: string }) {
  return (
    <PressableScale style={sytles.loginButton} onPress={props.press}>
      <View>
        <Text style={sytles.loginButtonTxt}>{props.text}</Text>
      </View>
    </PressableScale>
  );
}

const sytles = StyleSheet.create({
  bg: {
    ...padding(32, 32, 32, 32),
    display: "flex",
  },
  logoutButton: {
    borderRadius: 16,
    display: "flex",
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: "red",
    ...padding(16, 16, 16, 16),
  },
  loginButton: {
    borderRadius: 16,
    display: "flex",
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: "white",
    ...padding(16, 16, 16, 16),
  },
  logoutButtonTxt: {
    color: "black",
    fontWeight: "bold",
  },
  loginButtonTxt: {
    color: "black",
    fontWeight: "bold",
  },
  text: {
    color: "white",
    fontWeight: "bold",
  },
});
