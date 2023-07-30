module Deku.DOM.Attr.AriaOrientation where

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

data AriaOrientation = AriaOrientation

instance Attr Circle_ AriaOrientation String where
  attr AriaOrientation bothValues  = unsafeAttribute $ Both { key: "aria-orientation", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-orientation", value:  prop' value  })
  pureAttr AriaOrientation value  = unsafeAttribute $ This { key: "aria-orientation", value:  prop' value  }
  unpureAttr AriaOrientation eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-orientation", value:  prop' value  }

instance Attr Ellipse_ AriaOrientation String where
  attr AriaOrientation bothValues  = unsafeAttribute $ Both { key: "aria-orientation", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-orientation", value:  prop' value  })
  pureAttr AriaOrientation value  = unsafeAttribute $ This { key: "aria-orientation", value:  prop' value  }
  unpureAttr AriaOrientation eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-orientation", value:  prop' value  }

instance Attr ForeignObject_ AriaOrientation String where
  attr AriaOrientation bothValues  = unsafeAttribute $ Both { key: "aria-orientation", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-orientation", value:  prop' value  })
  pureAttr AriaOrientation value  = unsafeAttribute $ This { key: "aria-orientation", value:  prop' value  }
  unpureAttr AriaOrientation eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-orientation", value:  prop' value  }

instance Attr G_ AriaOrientation String where
  attr AriaOrientation bothValues  = unsafeAttribute $ Both { key: "aria-orientation", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-orientation", value:  prop' value  })
  pureAttr AriaOrientation value  = unsafeAttribute $ This { key: "aria-orientation", value:  prop' value  }
  unpureAttr AriaOrientation eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-orientation", value:  prop' value  }

instance Attr Line_ AriaOrientation String where
  attr AriaOrientation bothValues  = unsafeAttribute $ Both { key: "aria-orientation", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-orientation", value:  prop' value  })
  pureAttr AriaOrientation value  = unsafeAttribute $ This { key: "aria-orientation", value:  prop' value  }
  unpureAttr AriaOrientation eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-orientation", value:  prop' value  }

instance Attr Marker_ AriaOrientation String where
  attr AriaOrientation bothValues  = unsafeAttribute $ Both { key: "aria-orientation", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-orientation", value:  prop' value  })
  pureAttr AriaOrientation value  = unsafeAttribute $ This { key: "aria-orientation", value:  prop' value  }
  unpureAttr AriaOrientation eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-orientation", value:  prop' value  }

instance Attr Path_ AriaOrientation String where
  attr AriaOrientation bothValues  = unsafeAttribute $ Both { key: "aria-orientation", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-orientation", value:  prop' value  })
  pureAttr AriaOrientation value  = unsafeAttribute $ This { key: "aria-orientation", value:  prop' value  }
  unpureAttr AriaOrientation eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-orientation", value:  prop' value  }

instance Attr Polygon_ AriaOrientation String where
  attr AriaOrientation bothValues  = unsafeAttribute $ Both { key: "aria-orientation", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-orientation", value:  prop' value  })
  pureAttr AriaOrientation value  = unsafeAttribute $ This { key: "aria-orientation", value:  prop' value  }
  unpureAttr AriaOrientation eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-orientation", value:  prop' value  }

instance Attr Polyline_ AriaOrientation String where
  attr AriaOrientation bothValues  = unsafeAttribute $ Both { key: "aria-orientation", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-orientation", value:  prop' value  })
  pureAttr AriaOrientation value  = unsafeAttribute $ This { key: "aria-orientation", value:  prop' value  }
  unpureAttr AriaOrientation eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-orientation", value:  prop' value  }

instance Attr Rect_ AriaOrientation String where
  attr AriaOrientation bothValues  = unsafeAttribute $ Both { key: "aria-orientation", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-orientation", value:  prop' value  })
  pureAttr AriaOrientation value  = unsafeAttribute $ This { key: "aria-orientation", value:  prop' value  }
  unpureAttr AriaOrientation eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-orientation", value:  prop' value  }

instance Attr Svg_ AriaOrientation String where
  attr AriaOrientation bothValues  = unsafeAttribute $ Both { key: "aria-orientation", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-orientation", value:  prop' value  })
  pureAttr AriaOrientation value  = unsafeAttribute $ This { key: "aria-orientation", value:  prop' value  }
  unpureAttr AriaOrientation eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-orientation", value:  prop' value  }

instance Attr Symbol_ AriaOrientation String where
  attr AriaOrientation bothValues  = unsafeAttribute $ Both { key: "aria-orientation", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-orientation", value:  prop' value  })
  pureAttr AriaOrientation value  = unsafeAttribute $ This { key: "aria-orientation", value:  prop' value  }
  unpureAttr AriaOrientation eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-orientation", value:  prop' value  }

instance Attr Text_ AriaOrientation String where
  attr AriaOrientation bothValues  = unsafeAttribute $ Both { key: "aria-orientation", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-orientation", value:  prop' value  })
  pureAttr AriaOrientation value  = unsafeAttribute $ This { key: "aria-orientation", value:  prop' value  }
  unpureAttr AriaOrientation eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-orientation", value:  prop' value  }

instance Attr TextPath_ AriaOrientation String where
  attr AriaOrientation bothValues  = unsafeAttribute $ Both { key: "aria-orientation", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-orientation", value:  prop' value  })
  pureAttr AriaOrientation value  = unsafeAttribute $ This { key: "aria-orientation", value:  prop' value  }
  unpureAttr AriaOrientation eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-orientation", value:  prop' value  }

instance Attr Tspan_ AriaOrientation String where
  attr AriaOrientation bothValues  = unsafeAttribute $ Both { key: "aria-orientation", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-orientation", value:  prop' value  })
  pureAttr AriaOrientation value  = unsafeAttribute $ This { key: "aria-orientation", value:  prop' value  }
  unpureAttr AriaOrientation eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-orientation", value:  prop' value  }

instance Attr Use_ AriaOrientation String where
  attr AriaOrientation bothValues  = unsafeAttribute $ Both { key: "aria-orientation", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-orientation", value:  prop' value  })
  pureAttr AriaOrientation value  = unsafeAttribute $ This { key: "aria-orientation", value:  prop' value  }
  unpureAttr AriaOrientation eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-orientation", value:  prop' value  }

instance Attr View_ AriaOrientation String where
  attr AriaOrientation bothValues  = unsafeAttribute $ Both { key: "aria-orientation", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-orientation", value:  prop' value  })
  pureAttr AriaOrientation value  = unsafeAttribute $ This { key: "aria-orientation", value:  prop' value  }
  unpureAttr AriaOrientation eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-orientation", value:  prop' value  }

instance Attr everything AriaOrientation Unit where
  attr AriaOrientation bothValues  = unsafeAttribute $ Both { key: "aria-orientation", value:  unset'  } (snd bothValues <#> \_ -> { key: "aria-orientation", value:  unset'  })
  pureAttr AriaOrientation _  = unsafeAttribute $ This { key: "aria-orientation", value:  unset'  }
  unpureAttr AriaOrientation eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "aria-orientation", value:  unset'  }
