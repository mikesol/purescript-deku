module Deku.DOM.Attr.AriaRowindex where

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

data AriaRowindex = AriaRowindex

instance Attr Circle_ AriaRowindex String where
  attr AriaRowindex bothValues  = unsafeAttribute $ Both { key: "aria-rowindex", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-rowindex", value:  prop' value  })
  pureAttr AriaRowindex value  = unsafeAttribute $ This { key: "aria-rowindex", value:  prop' value  }
  unpureAttr AriaRowindex eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-rowindex", value:  prop' value  }

instance Attr Ellipse_ AriaRowindex String where
  attr AriaRowindex bothValues  = unsafeAttribute $ Both { key: "aria-rowindex", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-rowindex", value:  prop' value  })
  pureAttr AriaRowindex value  = unsafeAttribute $ This { key: "aria-rowindex", value:  prop' value  }
  unpureAttr AriaRowindex eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-rowindex", value:  prop' value  }

instance Attr ForeignObject_ AriaRowindex String where
  attr AriaRowindex bothValues  = unsafeAttribute $ Both { key: "aria-rowindex", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-rowindex", value:  prop' value  })
  pureAttr AriaRowindex value  = unsafeAttribute $ This { key: "aria-rowindex", value:  prop' value  }
  unpureAttr AriaRowindex eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-rowindex", value:  prop' value  }

instance Attr G_ AriaRowindex String where
  attr AriaRowindex bothValues  = unsafeAttribute $ Both { key: "aria-rowindex", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-rowindex", value:  prop' value  })
  pureAttr AriaRowindex value  = unsafeAttribute $ This { key: "aria-rowindex", value:  prop' value  }
  unpureAttr AriaRowindex eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-rowindex", value:  prop' value  }

instance Attr Line_ AriaRowindex String where
  attr AriaRowindex bothValues  = unsafeAttribute $ Both { key: "aria-rowindex", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-rowindex", value:  prop' value  })
  pureAttr AriaRowindex value  = unsafeAttribute $ This { key: "aria-rowindex", value:  prop' value  }
  unpureAttr AriaRowindex eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-rowindex", value:  prop' value  }

instance Attr Marker_ AriaRowindex String where
  attr AriaRowindex bothValues  = unsafeAttribute $ Both { key: "aria-rowindex", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-rowindex", value:  prop' value  })
  pureAttr AriaRowindex value  = unsafeAttribute $ This { key: "aria-rowindex", value:  prop' value  }
  unpureAttr AriaRowindex eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-rowindex", value:  prop' value  }

instance Attr Path_ AriaRowindex String where
  attr AriaRowindex bothValues  = unsafeAttribute $ Both { key: "aria-rowindex", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-rowindex", value:  prop' value  })
  pureAttr AriaRowindex value  = unsafeAttribute $ This { key: "aria-rowindex", value:  prop' value  }
  unpureAttr AriaRowindex eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-rowindex", value:  prop' value  }

instance Attr Polygon_ AriaRowindex String where
  attr AriaRowindex bothValues  = unsafeAttribute $ Both { key: "aria-rowindex", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-rowindex", value:  prop' value  })
  pureAttr AriaRowindex value  = unsafeAttribute $ This { key: "aria-rowindex", value:  prop' value  }
  unpureAttr AriaRowindex eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-rowindex", value:  prop' value  }

instance Attr Polyline_ AriaRowindex String where
  attr AriaRowindex bothValues  = unsafeAttribute $ Both { key: "aria-rowindex", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-rowindex", value:  prop' value  })
  pureAttr AriaRowindex value  = unsafeAttribute $ This { key: "aria-rowindex", value:  prop' value  }
  unpureAttr AriaRowindex eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-rowindex", value:  prop' value  }

instance Attr Rect_ AriaRowindex String where
  attr AriaRowindex bothValues  = unsafeAttribute $ Both { key: "aria-rowindex", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-rowindex", value:  prop' value  })
  pureAttr AriaRowindex value  = unsafeAttribute $ This { key: "aria-rowindex", value:  prop' value  }
  unpureAttr AriaRowindex eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-rowindex", value:  prop' value  }

instance Attr Svg_ AriaRowindex String where
  attr AriaRowindex bothValues  = unsafeAttribute $ Both { key: "aria-rowindex", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-rowindex", value:  prop' value  })
  pureAttr AriaRowindex value  = unsafeAttribute $ This { key: "aria-rowindex", value:  prop' value  }
  unpureAttr AriaRowindex eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-rowindex", value:  prop' value  }

instance Attr Symbol_ AriaRowindex String where
  attr AriaRowindex bothValues  = unsafeAttribute $ Both { key: "aria-rowindex", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-rowindex", value:  prop' value  })
  pureAttr AriaRowindex value  = unsafeAttribute $ This { key: "aria-rowindex", value:  prop' value  }
  unpureAttr AriaRowindex eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-rowindex", value:  prop' value  }

instance Attr Text_ AriaRowindex String where
  attr AriaRowindex bothValues  = unsafeAttribute $ Both { key: "aria-rowindex", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-rowindex", value:  prop' value  })
  pureAttr AriaRowindex value  = unsafeAttribute $ This { key: "aria-rowindex", value:  prop' value  }
  unpureAttr AriaRowindex eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-rowindex", value:  prop' value  }

instance Attr TextPath_ AriaRowindex String where
  attr AriaRowindex bothValues  = unsafeAttribute $ Both { key: "aria-rowindex", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-rowindex", value:  prop' value  })
  pureAttr AriaRowindex value  = unsafeAttribute $ This { key: "aria-rowindex", value:  prop' value  }
  unpureAttr AriaRowindex eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-rowindex", value:  prop' value  }

instance Attr Tspan_ AriaRowindex String where
  attr AriaRowindex bothValues  = unsafeAttribute $ Both { key: "aria-rowindex", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-rowindex", value:  prop' value  })
  pureAttr AriaRowindex value  = unsafeAttribute $ This { key: "aria-rowindex", value:  prop' value  }
  unpureAttr AriaRowindex eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-rowindex", value:  prop' value  }

instance Attr Use_ AriaRowindex String where
  attr AriaRowindex bothValues  = unsafeAttribute $ Both { key: "aria-rowindex", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-rowindex", value:  prop' value  })
  pureAttr AriaRowindex value  = unsafeAttribute $ This { key: "aria-rowindex", value:  prop' value  }
  unpureAttr AriaRowindex eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-rowindex", value:  prop' value  }

instance Attr View_ AriaRowindex String where
  attr AriaRowindex bothValues  = unsafeAttribute $ Both { key: "aria-rowindex", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "aria-rowindex", value:  prop' value  })
  pureAttr AriaRowindex value  = unsafeAttribute $ This { key: "aria-rowindex", value:  prop' value  }
  unpureAttr AriaRowindex eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "aria-rowindex", value:  prop' value  }

instance Attr everything AriaRowindex Unit where
  attr AriaRowindex bothValues  = unsafeAttribute $ Both { key: "aria-rowindex", value:  unset'  } (snd bothValues <#> \_ -> { key: "aria-rowindex", value:  unset'  })
  pureAttr AriaRowindex _  = unsafeAttribute $ This { key: "aria-rowindex", value:  unset'  }
  unpureAttr AriaRowindex eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "aria-rowindex", value:  unset'  }
