module Deku.DOM.Attr.XlinkTitle where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.Mpath (Mpath_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data XlinkTitle = XlinkTitle

instance Attr AnimateTransform_ XlinkTitle String where
  attr XlinkTitle bothValues  = unsafeAttribute $ Both { key: "xlink:title", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "xlink:title", value:  prop' value  })
  pureAttr XlinkTitle value  = unsafeAttribute $ This { key: "xlink:title", value:  prop' value  }
  unpureAttr XlinkTitle eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "xlink:title", value:  prop' value  }

instance Attr FeImage_ XlinkTitle String where
  attr XlinkTitle bothValues  = unsafeAttribute $ Both { key: "xlink:title", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "xlink:title", value:  prop' value  })
  pureAttr XlinkTitle value  = unsafeAttribute $ This { key: "xlink:title", value:  prop' value  }
  unpureAttr XlinkTitle eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "xlink:title", value:  prop' value  }

instance Attr Filter_ XlinkTitle String where
  attr XlinkTitle bothValues  = unsafeAttribute $ Both { key: "xlink:title", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "xlink:title", value:  prop' value  })
  pureAttr XlinkTitle value  = unsafeAttribute $ This { key: "xlink:title", value:  prop' value  }
  unpureAttr XlinkTitle eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "xlink:title", value:  prop' value  }

instance Attr Image_ XlinkTitle String where
  attr XlinkTitle bothValues  = unsafeAttribute $ Both { key: "xlink:title", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "xlink:title", value:  prop' value  })
  pureAttr XlinkTitle value  = unsafeAttribute $ This { key: "xlink:title", value:  prop' value  }
  unpureAttr XlinkTitle eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "xlink:title", value:  prop' value  }

instance Attr LinearGradient_ XlinkTitle String where
  attr XlinkTitle bothValues  = unsafeAttribute $ Both { key: "xlink:title", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "xlink:title", value:  prop' value  })
  pureAttr XlinkTitle value  = unsafeAttribute $ This { key: "xlink:title", value:  prop' value  }
  unpureAttr XlinkTitle eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "xlink:title", value:  prop' value  }

instance Attr Mpath_ XlinkTitle String where
  attr XlinkTitle bothValues  = unsafeAttribute $ Both { key: "xlink:title", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "xlink:title", value:  prop' value  })
  pureAttr XlinkTitle value  = unsafeAttribute $ This { key: "xlink:title", value:  prop' value  }
  unpureAttr XlinkTitle eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "xlink:title", value:  prop' value  }

instance Attr Pattern_ XlinkTitle String where
  attr XlinkTitle bothValues  = unsafeAttribute $ Both { key: "xlink:title", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "xlink:title", value:  prop' value  })
  pureAttr XlinkTitle value  = unsafeAttribute $ This { key: "xlink:title", value:  prop' value  }
  unpureAttr XlinkTitle eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "xlink:title", value:  prop' value  }

instance Attr RadialGradient_ XlinkTitle String where
  attr XlinkTitle bothValues  = unsafeAttribute $ Both { key: "xlink:title", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "xlink:title", value:  prop' value  })
  pureAttr XlinkTitle value  = unsafeAttribute $ This { key: "xlink:title", value:  prop' value  }
  unpureAttr XlinkTitle eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "xlink:title", value:  prop' value  }

instance Attr everything XlinkTitle Unit where
  attr XlinkTitle bothValues  = unsafeAttribute $ Both { key: "xlink:title", value:  unset'  } (snd bothValues <#> \_ -> { key: "xlink:title", value:  unset'  })
  pureAttr XlinkTitle _  = unsafeAttribute $ This { key: "xlink:title", value:  unset'  }
  unpureAttr XlinkTitle eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "xlink:title", value:  unset'  }
