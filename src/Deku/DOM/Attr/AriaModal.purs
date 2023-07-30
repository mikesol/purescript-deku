module Deku.DOM.Attr.AriaModal where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.View (View_)
import Deku.DOM.Elt.Use (Use_)
import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.Polyline (Polyline_)
import Deku.DOM.Elt.Polygon (Polygon_)
import Deku.DOM.Elt.Path (Path_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.DOM.Elt.Line (Line_)
import Deku.DOM.Elt.G (G_)
import Deku.DOM.Elt.ForeignObject (ForeignObject_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data AriaModal = AriaModal

instance Attr Circle_ AriaModal String where
  attr AriaModal bothValues  = unsafeAttribute $ Both { key: "aria-modal", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-modal", value:  prop' value  })
  pureAttr AriaModal value  = unsafeAttribute $ This { key: "aria-modal", value:  prop' value  }
  unpureAttr AriaModal eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-modal", value:  prop' value  }

instance Attr Ellipse_ AriaModal String where
  attr AriaModal bothValues  = unsafeAttribute $ Both { key: "aria-modal", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-modal", value:  prop' value  })
  pureAttr AriaModal value  = unsafeAttribute $ This { key: "aria-modal", value:  prop' value  }
  unpureAttr AriaModal eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-modal", value:  prop' value  }

instance Attr ForeignObject_ AriaModal String where
  attr AriaModal bothValues  = unsafeAttribute $ Both { key: "aria-modal", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-modal", value:  prop' value  })
  pureAttr AriaModal value  = unsafeAttribute $ This { key: "aria-modal", value:  prop' value  }
  unpureAttr AriaModal eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-modal", value:  prop' value  }

instance Attr G_ AriaModal String where
  attr AriaModal bothValues  = unsafeAttribute $ Both { key: "aria-modal", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-modal", value:  prop' value  })
  pureAttr AriaModal value  = unsafeAttribute $ This { key: "aria-modal", value:  prop' value  }
  unpureAttr AriaModal eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-modal", value:  prop' value  }

instance Attr Line_ AriaModal String where
  attr AriaModal bothValues  = unsafeAttribute $ Both { key: "aria-modal", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-modal", value:  prop' value  })
  pureAttr AriaModal value  = unsafeAttribute $ This { key: "aria-modal", value:  prop' value  }
  unpureAttr AriaModal eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-modal", value:  prop' value  }

instance Attr Marker_ AriaModal String where
  attr AriaModal bothValues  = unsafeAttribute $ Both { key: "aria-modal", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-modal", value:  prop' value  })
  pureAttr AriaModal value  = unsafeAttribute $ This { key: "aria-modal", value:  prop' value  }
  unpureAttr AriaModal eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-modal", value:  prop' value  }

instance Attr Path_ AriaModal String where
  attr AriaModal bothValues  = unsafeAttribute $ Both { key: "aria-modal", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-modal", value:  prop' value  })
  pureAttr AriaModal value  = unsafeAttribute $ This { key: "aria-modal", value:  prop' value  }
  unpureAttr AriaModal eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-modal", value:  prop' value  }

instance Attr Polygon_ AriaModal String where
  attr AriaModal bothValues  = unsafeAttribute $ Both { key: "aria-modal", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-modal", value:  prop' value  })
  pureAttr AriaModal value  = unsafeAttribute $ This { key: "aria-modal", value:  prop' value  }
  unpureAttr AriaModal eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-modal", value:  prop' value  }

instance Attr Polyline_ AriaModal String where
  attr AriaModal bothValues  = unsafeAttribute $ Both { key: "aria-modal", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-modal", value:  prop' value  })
  pureAttr AriaModal value  = unsafeAttribute $ This { key: "aria-modal", value:  prop' value  }
  unpureAttr AriaModal eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-modal", value:  prop' value  }

instance Attr Rect_ AriaModal String where
  attr AriaModal bothValues  = unsafeAttribute $ Both { key: "aria-modal", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-modal", value:  prop' value  })
  pureAttr AriaModal value  = unsafeAttribute $ This { key: "aria-modal", value:  prop' value  }
  unpureAttr AriaModal eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-modal", value:  prop' value  }

instance Attr Svg_ AriaModal String where
  attr AriaModal bothValues  = unsafeAttribute $ Both { key: "aria-modal", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-modal", value:  prop' value  })
  pureAttr AriaModal value  = unsafeAttribute $ This { key: "aria-modal", value:  prop' value  }
  unpureAttr AriaModal eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-modal", value:  prop' value  }

instance Attr Symbol_ AriaModal String where
  attr AriaModal bothValues  = unsafeAttribute $ Both { key: "aria-modal", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-modal", value:  prop' value  })
  pureAttr AriaModal value  = unsafeAttribute $ This { key: "aria-modal", value:  prop' value  }
  unpureAttr AriaModal eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-modal", value:  prop' value  }

instance Attr Text_ AriaModal String where
  attr AriaModal bothValues  = unsafeAttribute $ Both { key: "aria-modal", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-modal", value:  prop' value  })
  pureAttr AriaModal value  = unsafeAttribute $ This { key: "aria-modal", value:  prop' value  }
  unpureAttr AriaModal eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-modal", value:  prop' value  }

instance Attr TextPath_ AriaModal String where
  attr AriaModal bothValues  = unsafeAttribute $ Both { key: "aria-modal", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-modal", value:  prop' value  })
  pureAttr AriaModal value  = unsafeAttribute $ This { key: "aria-modal", value:  prop' value  }
  unpureAttr AriaModal eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-modal", value:  prop' value  }

instance Attr Tspan_ AriaModal String where
  attr AriaModal bothValues  = unsafeAttribute $ Both { key: "aria-modal", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-modal", value:  prop' value  })
  pureAttr AriaModal value  = unsafeAttribute $ This { key: "aria-modal", value:  prop' value  }
  unpureAttr AriaModal eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-modal", value:  prop' value  }

instance Attr Use_ AriaModal String where
  attr AriaModal bothValues  = unsafeAttribute $ Both { key: "aria-modal", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-modal", value:  prop' value  })
  pureAttr AriaModal value  = unsafeAttribute $ This { key: "aria-modal", value:  prop' value  }
  unpureAttr AriaModal eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-modal", value:  prop' value  }

instance Attr View_ AriaModal String where
  attr AriaModal bothValues  = unsafeAttribute $ Both { key: "aria-modal", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-modal", value:  prop' value  })
  pureAttr AriaModal value  = unsafeAttribute $ This { key: "aria-modal", value:  prop' value  }
  unpureAttr AriaModal eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-modal", value:  prop' value  }

instance Attr everything AriaModal Unit where
  attr AriaModal bothValues  = unsafeAttribute $ Both { key: "aria-modal", value:  unset'  } (snd bothValues <#> \_ -> { key: "aria-modal", value:  unset'  })
  pureAttr AriaModal _  = unsafeAttribute $ This { key: "aria-modal", value:  unset'  }
  unpureAttr AriaModal eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "aria-modal", value:  unset'  }
