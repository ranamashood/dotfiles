const hyprland = await Service.import("hyprland");
const mpris = await Service.import("mpris");
const audio = await Service.import("audio");
const battery = await Service.import("battery");
const systemtray = await Service.import("systemtray");

const date = Variable("", {
  poll: [1000, 'date "+%H:%M:%S %b %e."'],
});

// widgets can be only assigned as a child in one container
// so to make a reuseable widget, make it a function
// then you can simply instantiate one by calling it

function Workspaces() {
  const activeId = hyprland.active.workspace.bind("id");
  const workspaces = hyprland.bind("workspaces").as((ws) =>
    ws.map(({ id }) =>
      Widget.Button({
        on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
        child: Widget.Label(`${id}`),
        class_name: activeId.as((i) => `${i === id ? "focused" : ""}`),
      }),
    ),
  );

  return Widget.Box({
    class_name: "workspaces",
    children: workspaces,
  });
}

function ClientTitle() {
  return Widget.Label({
    class_name: "client-title",
    label: hyprland.active.client.bind("title"),
  });
}

function Clock() {
  return Widget.Label({
    class_name: "clock",
    label: date.bind(),
  });
}

function Media() {
  const label = Utils.watch("", mpris, "player-changed", () => {
    if (mpris.players[0]) {
      const { track_artists, track_title } = mpris.players[0];
      return `${track_artists.join(", ")} - ${track_title}`;
    } else {
      return "Nothing is playing";
    }
  });

  return Widget.Button({
    class_name: "media",
    on_primary_click: () => mpris.getPlayer("")?.playPause(),
    on_scroll_up: () => mpris.getPlayer("")?.next(),
    on_scroll_down: () => mpris.getPlayer("")?.previous(),
    child: Widget.Label({ label }),
  });
}

function Volume() {
  const icons = {
    101: "overamplified",
    67: "high",
    34: "medium",
    1: "low",
    0: "muted",
  };

  function getIcon() {
    const icon = audio.speaker.is_muted
      ? 0
      : [101, 67, 34, 1, 0].find(
          (threshold) => threshold <= audio.speaker.volume * 100,
        );

    return `audio-volume-${icons[icon]}-symbolic`;
  }

  const icon = Widget.Icon({
    icon: Utils.watch(getIcon(), audio.speaker, getIcon),
  });

  function getVolume() {
    return `${Math.floor(audio.speaker.volume * 100).toString()}%`;
  }

  const label = Widget.Label({
    label: Utils.watch(getVolume(), audio.speaker, getVolume),
  });

  return Widget.Box({
    class_name: "volume",
    children: [icon, label],
  });
}

function Microphone() {
  const icons = {
    67: "high",
    34: "medium",
    1: "low",
    0: "muted",
  };

  function getIcon() {
    const icon = audio.microphone.is_muted
      ? 0
      : [67, 34, 1, 0].find(
          (threshold) => threshold <= audio.microphone.volume * 100,
        );

    return `microphone-sensitivity-${icons[icon]}-symbolic`;
  }

  const icon = Widget.Icon({
    icon: Utils.watch(getIcon(), audio.microphone, getIcon),
  });

  function getVolume() {
    return `${Math.floor(audio.microphone.volume * 100).toString()}%`;
  }

  const label = Widget.Label({
    label: Utils.watch(getVolume(), audio.microphone, getVolume),
  });

  return Widget.Box({
    class_name: "microphone",
    children: [icon, label],
  });
}

function BatteryLabel() {
  function getIcon() {
    return battery.icon_name;
  }

  const icon = Widget.Icon({
    icon: Utils.watch(getIcon(), battery, getIcon),
  });

  function getBattery() {
    return `${battery.percent.toString()}%`;
  }

  const label = Widget.Label({
    label: Utils.watch(getBattery(), battery, getBattery),
  });

  return Widget.Box({
    class_name: "battery",
    visible: battery.bind("available"),
    children: [icon, label],
  });
}

function SysTray() {
  const items = systemtray.bind("items").as((items) =>
    items.map((item) =>
      Widget.Button({
        child: Widget.Icon({ icon: item.bind("icon") }),
        on_primary_click: (_, event) => item.activate(event),
        on_secondary_click: (_, event) => item.openMenu(event),
        tooltip_markup: item.bind("tooltip_markup"),
      }),
    ),
  );

  return Widget.Box({
    children: items,
  });
}

// layout of the bar
function Left() {
  return Widget.Box({
    spacing: 8,
    children: [Workspaces(), ClientTitle()],
  });
}

function Center() {
  return Widget.Box({
    spacing: 8,
    children: [Media()],
  });
}

function Right() {
  return Widget.Box({
    hpack: "end",
    spacing: 8,
    children: [Volume(), Microphone(), BatteryLabel(), Clock(), SysTray()],
  });
}

function Bar(monitor = 0) {
  return Widget.Window({
    name: `bar-${monitor}`, // name has to be unique
    class_name: "bar",
    monitor,
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    child: Widget.CenterBox({
      start_widget: Left(),
      center_widget: Center(),
      end_widget: Right(),
    }),
  });
}

App.config({
  style: "./style.css",
  windows: [
    Bar(),

    // you can call it, for each monitor
    // Bar(0),
    // Bar(1)
  ],
});

export {};
