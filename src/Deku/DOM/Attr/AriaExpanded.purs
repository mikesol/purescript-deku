module Deku.DOM.Attr.AriaExpanded where

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

data AriaExpanded = AriaExpanded

instance Attr Circle_ AriaExpanded String where
  attr AriaExpanded bothValues  = unsafeAttribute $ Both { key: "aria-expanded", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-expanded", value:  prop' value  })
  pureAttr AriaExpanded value  = unsafeAttribute $ This { key: "aria-expanded", value:  prop' value  }
  unpureAttr AriaExpanded eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-expanded", value:  prop' value  }

instance Attr Ellipse_ AriaExpanded String where
  attr AriaExpanded bothValues  = unsafeAttribute $ Both { key: "aria-expanded", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-expanded", value:  prop' value  })
  pureAttr AriaExpanded value  = unsafeAttribute $ This { key: "aria-expanded", value:  prop' value  }
  unpureAttr AriaExpanded eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-expanded", value:  prop' value  }

instance Attr ForeignObject_ AriaExpanded String where
  attr AriaExpanded bothValues  = unsafeAttribute $ Both { key: "aria-expanded", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-expanded", value:  prop' value  })
  pureAttr AriaExpanded value  = unsafeAttribute $ This { key: "aria-expanded", value:  prop' value  }
  unpureAttr AriaExpanded eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-expanded", value:  prop' value  }

instance Attr G_ AriaExpanded String where
  attr AriaExpanded bothValues  = unsafeAttribute $ Both { key: "aria-expanded", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-expanded", value:  prop' value  })
  pureAttr AriaExpanded value  = unsafeAttribute $ This { key: "aria-expanded", value:  prop' value  }
  unpureAttr AriaExpanded eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-expanded", value:  prop' value  }

instance Attr Line_ AriaExpanded String where
  attr AriaExpanded bothValues  = unsafeAttribute $ Both { key: "aria-expanded", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-expanded", value:  prop' value  })
  pureAttr AriaExpanded value  = unsafeAttribute $ This { key: "aria-expanded", value:  prop' value  }
  unpureAttr AriaExpanded eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-expanded", value:  prop' value  }

instance Attr Marker_ AriaExpanded String where
  attr AriaExpanded bothValues  = unsafeAttribute $ Both { key: "aria-expanded", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-expanded", value:  prop' value  })
  pureAttr AriaExpanded value  = unsafeAttribute $ This { key: "aria-expanded", value:  prop' value  }
  unpureAttr AriaExpanded eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-expanded", value:  prop' value  }

instance Attr Path_ AriaExpanded String where
  attr AriaExpanded bothValues  = unsafeAttribute $ Both { key: "aria-expanded", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-expanded", value:  prop' value  })
  pureAttr AriaExpanded value  = unsafeAttribute $ This { key: "aria-expanded", value:  prop' value  }
  unpureAttr AriaExpanded eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-expanded", value:  prop' value  }

instance Attr Polygon_ AriaExpanded String where
  attr AriaExpanded bothValues  = unsafeAttribute $ Both { key: "aria-expanded", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-expanded", value:  prop' value  })
  pureAttr AriaExpanded value  = unsafeAttribute $ This { key: "aria-expanded", value:  prop' value  }
  unpureAttr AriaExpanded eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-expanded", value:  prop' value  }

instance Attr Polyline_ AriaExpanded String where
  attr AriaExpanded bothValues  = unsafeAttribute $ Both { key: "aria-expanded", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-expanded", value:  prop' value  })
  pureAttr AriaExpanded value  = unsafeAttribute $ This { key: "aria-expanded", value:  prop' value  }
  unpureAttr AriaExpanded eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-expanded", value:  prop' value  }

instance Attr Rect_ AriaExpanded String where
  attr AriaExpanded bothValues  = unsafeAttribute $ Both { key: "aria-expanded", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-expanded", value:  prop' value  })
  pureAttr AriaExpanded value  = unsafeAttribute $ This { key: "aria-expanded", value:  prop' value  }
  unpureAttr AriaExpanded eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-expanded", value:  prop' value  }

instance Attr Svg_ AriaExpanded String where
  attr AriaExpanded bothValues  = unsafeAttribute $ Both { key: "aria-expanded", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-expanded", value:  prop' value  })
  pureAttr AriaExpanded value  = unsafeAttribute $ This { key: "aria-expanded", value:  prop' value  }
  unpureAttr AriaExpanded eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-expanded", value:  prop' value  }

instance Attr Symbol_ AriaExpanded String where
  attr AriaExpanded bothValues  = unsafeAttribute $ Both { key: "aria-expanded", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-expanded", value:  prop' value  })
  pureAttr AriaExpanded value  = unsafeAttribute $ This { key: "aria-expanded", value:  prop' value  }
  unpureAttr AriaExpanded eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-expanded", value:  prop' value  }

instance Attr Text_ AriaExpanded String where
  attr AriaExpanded bothValues  = unsafeAttribute $ Both { key: "aria-expanded", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-expanded", value:  prop' value  })
  pureAttr AriaExpanded value  = unsafeAttribute $ This { key: "aria-expanded", value:  prop' value  }
  unpureAttr AriaExpanded eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-expanded", value:  prop' value  }

instance Attr TextPath_ AriaExpanded String where
  attr AriaExpanded bothValues  = unsafeAttribute $ Both { key: "aria-expanded", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-expanded", value:  prop' value  })
  pureAttr AriaExpanded value  = unsafeAttribute $ This { key: "aria-expanded", value:  prop' value  }
  unpureAttr AriaExpanded eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-expanded", value:  prop' value  }

instance Attr Tspan_ AriaExpanded String where
  attr AriaExpanded bothValues  = unsafeAttribute $ Both { key: "aria-expanded", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-expanded", value:  prop' value  })
  pureAttr AriaExpanded value  = unsafeAttribute $ This { key: "aria-expanded", value:  prop' value  }
  unpureAttr AriaExpanded eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-expanded", value:  prop' value  }

instance Attr Use_ AriaExpanded String where
  attr AriaExpanded bothValues  = unsafeAttribute $ Both { key: "aria-expanded", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-expanded", value:  prop' value  })
  pureAttr AriaExpanded value  = unsafeAttribute $ This { key: "aria-expanded", value:  prop' value  }
  unpureAttr AriaExpanded eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-expanded", value:  prop' value  }

instance Attr View_ AriaExpanded String where
  attr AriaExpanded bothValues  = unsafeAttribute $ Both { key: "aria-expanded", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-expanded", value:  prop' value  })
  pureAttr AriaExpanded value  = unsafeAttribute $ This { key: "aria-expanded", value:  prop' value  }
  unpureAttr AriaExpanded eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-expanded", value:  prop' value  }

instance Attr everything AriaExpanded Unit where
  attr AriaExpanded bothValues  = unsafeAttribute $ Both { key: "aria-expanded", value:  unset'  } (snd bothValues <#> \_ -> { key: "aria-expanded", value:  unset'  })
  pureAttr AriaExpanded _  = unsafeAttribute $ This { key: "aria-expanded", value:  unset'  }
  unpureAttr AriaExpanded eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "aria-expanded", value:  unset'  }
