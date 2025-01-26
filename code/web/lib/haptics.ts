import React from "react";
import { impactAsync, ImpactFeedbackStyle } from "expo-haptics";

import { isIOS, isWeb } from "../platform/detection";

export function useHaptics() {
  return (strength: "Light" | "Medium" | "Heavy" = "Medium") => {
    // Users said the medium impact was too strong on Android; see APP-537s
    const style = isIOS
      ? ImpactFeedbackStyle[strength]
      : ImpactFeedbackStyle.Light;
    impactAsync(style);
  };
}
