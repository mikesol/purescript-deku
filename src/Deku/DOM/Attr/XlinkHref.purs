module Deku.DOM.Attr.XlinkHref where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Use (Use_)
import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.Mpath (Mpath_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data XlinkHref = XlinkHref

instance Attr AnimateTransform_ XlinkHref String where
  attr XlinkHref bothValues  = unsafeAttribute $ Both { key: "xlink:href", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "xlink:href", value:  prop' value  })
  pureAttr XlinkHref value  = unsafeAttribute $ This { key: "xlink:href", value:  prop' value  }
  unpureAttr XlinkHref eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "xlink:href", value:  prop' value  }

instance Attr FeImage_ XlinkHref String where
  attr XlinkHref bothValues  = unsafeAttribute $ Both { key: "xlink:href", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "xlink:href", value:  prop' value  })
  pureAttr XlinkHref value  = unsafeAttribute $ This { key: "xlink:href", value:  prop' value  }
  unpureAttr XlinkHref eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "xlink:href", value:  prop' value  }

instance Attr Filter_ XlinkHref String where
  attr XlinkHref bothValues  = unsafeAttribute $ Both { key: "xlink:href", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "xlink:href", value:  prop' value  })
  pureAttr XlinkHref value  = unsafeAttribute $ This { key: "xlink:href", value:  prop' value  }
  unpureAttr XlinkHref eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "xlink:href", value:  prop' value  }

instance Attr Image_ XlinkHref String where
  attr XlinkHref bothValues  = unsafeAttribute $ Both { key: "xlink:href", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "xlink:href", value:  prop' value  })
  pureAttr XlinkHref value  = unsafeAttribute $ This { key: "xlink:href", value:  prop' value  }
  unpureAttr XlinkHref eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "xlink:href", value:  prop' value  }

instance Attr LinearGradient_ XlinkHref String where
  attr XlinkHref bothValues  = unsafeAttribute $ Both { key: "xlink:href", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "xlink:href", value:  prop' value  })
  pureAttr XlinkHref value  = unsafeAttribute $ This { key: "xlink:href", value:  prop' value  }
  unpureAttr XlinkHref eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "xlink:href", value:  prop' value  }

instance Attr Mpath_ XlinkHref String where
  attr XlinkHref bothValues  = unsafeAttribute $ Both { key: "xlink:href", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "xlink:href", value:  prop' value  })
  pureAttr XlinkHref value  = unsafeAttribute $ This { key: "xlink:href", value:  prop' value  }
  unpureAttr XlinkHref eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "xlink:href", value:  prop' value  }

instance Attr Pattern_ XlinkHref String where
  attr XlinkHref bothValues  = unsafeAttribute $ Both { key: "xlink:href", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "xlink:href", value:  prop' value  })
  pureAttr XlinkHref value  = unsafeAttribute $ This { key: "xlink:href", value:  prop' value  }
  unpureAttr XlinkHref eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "xlink:href", value:  prop' value  }

instance Attr RadialGradient_ XlinkHref String where
  attr XlinkHref bothValues  = unsafeAttribute $ Both { key: "xlink:href", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "xlink:href", value:  prop' value  })
  pureAttr XlinkHref value  = unsafeAttribute $ This { key: "xlink:href", value:  prop' value  }
  unpureAttr XlinkHref eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "xlink:href", value:  prop' value  }

instance Attr Use_ XlinkHref String where
  attr XlinkHref bothValues  = unsafeAttribute $ Both { key: "xlink:href", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "xlink:href", value:  prop' value  })
  pureAttr XlinkHref value  = unsafeAttribute $ This { key: "xlink:href", value:  prop' value  }
  unpureAttr XlinkHref eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "xlink:href", value:  prop' value  }

instance Attr everything XlinkHref Unit where
  attr XlinkHref bothValues  = unsafeAttribute $ Both { key: "xlink:href", value:  unset'  } (snd bothValues <#> \_ -> { key: "xlink:href", value:  unset'  })
  pureAttr XlinkHref _  = unsafeAttribute $ This { key: "xlink:href", value:  unset'  }
  unpureAttr XlinkHref eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "xlink:href", value:  unset'  }
