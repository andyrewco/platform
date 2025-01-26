import { StyleSheet, TouchableWithoutFeedback } from "react-native";
import {
  SafeAreaView,
  useSafeAreaInsets,
} from "react-native-safe-area-context";
import Animated, { clamp } from "react-native-reanimated";
import { useHaptics } from "../../lib/haptics";
import { PressableScale } from "../../lib/custom-animations/PressableScale";
import { ComponentProps } from "react";

export interface FABProps
  extends ComponentProps<typeof TouchableWithoutFeedback> {
  testID?: string;
  color: string;
  icon: JSX.Element;
}

export function FAB({ testID, icon, color, onPress, ...props }: FABProps) {
  const insets = useSafeAreaInsets();
  const playHaptic = useHaptics();
  const spacing = {
    right: 24,
    bottom: 24,
  };

  const bg = {
    backgroundColor: color,
  };

  return (
    <PressableScale
      style={[styles.outer, styles.inner, styles.sizeLarge, spacing, bg]}
      testID={testID}
      onPressIn={() => playHaptic("Light")}
      onPress={(evt) => {
        onPress?.(evt);
        playHaptic("Light");
      }}
      onLongPress={(evt: any) => {
        onPress?.(evt);
        playHaptic("Heavy");
      }}
      targetScale={0.9}
      {...props}
    >
      <Animated.View>{icon}</Animated.View>
    </PressableScale>
  );
}

const styles = StyleSheet.create({
  sizeLarge: {
    width: 70,
    height: 70,
    borderRadius: 35,
  },
  outer: {
    // @ts-ignore web-only
    position: "absolute",
    zIndex: 1,
    cursor: "pointer",
  },
  inner: {
    justifyContent: "center",
    alignItems: "center",
  },
});
