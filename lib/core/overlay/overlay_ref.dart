import 'dart:html';
import "dart:async";
import "../portal/portal.dart";
import "overlay_state.dart";

/**
 * Reference to an overlay that has been created with the Overlay service.
 * Used to manipulate or dispose of said overlay.
 */
class OverlayRef implements PortalHost {
  PortalHost _portalHost;
  Element _pane;
  OverlayState _state;

  OverlayRef(this._portalHost, this._pane, this._state);

  Future<dynamic> attach(Portal<dynamic> portal) {
    return _portalHost.attach(portal).then((_) {
      _updatePosition();
    });
  }

  Future<dynamic> detach() => _portalHost.detach();

  void dispose() {
    _portalHost.dispose();
  }

  bool hasAttached() => _portalHost.hasAttached();

  /** Gets the current state config of the overlay. */
  OverlayState getState() => _state;

  /** Updates the position of the overlay based on the position strategy. */
  void _updatePosition() {
    if (_state.positionStrategy != null) {
      _state.positionStrategy.apply(_pane);
    }
  }
}
