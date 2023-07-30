module Deku.DOM.Attr.Alt where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Applet (Applet_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Alt = Alt

instance Attr Applet_ Alt String where
  attr Alt bothValues  = unsafeAttribute $ Both { key: "alt", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "alt", value:  prop' value  })
  pureAttr Alt value  = unsafeAttribute $ This { key: "alt", value:  prop' value  }
  unpureAttr Alt eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "alt", value:  prop' value  }

instance Attr Area_ Alt String where
  attr Alt bothValues  = unsafeAttribute $ Both { key: "alt", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "alt", value:  prop' value  })
  pureAttr Alt value  = unsafeAttribute $ This { key: "alt", value:  prop' value  }
  unpureAttr Alt eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "alt", value:  prop' value  }

instance Attr Img_ Alt String where
  attr Alt bothValues  = unsafeAttribute $ Both { key: "alt", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "alt", value:  prop' value  })
  pureAttr Alt value  = unsafeAttribute $ This { key: "alt", value:  prop' value  }
  unpureAttr Alt eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "alt", value:  prop' value  }

instance Attr Input_ Alt String where
  attr Alt bothValues  = unsafeAttribute $ Both { key: "alt", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "alt", value:  prop' value  })
  pureAttr Alt value  = unsafeAttribute $ This { key: "alt", value:  prop' value  }
  unpureAttr Alt eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "alt", value:  prop' value  }

instance Attr everything Alt Unit where
  attr Alt bothValues  = unsafeAttribute $ Both { key: "alt", value:  unset'  } (snd bothValues <#> \_ -> { key: "alt", value:  unset'  })
  pureAttr Alt _  = unsafeAttribute $ This { key: "alt", value:  unset'  }
  unpureAttr Alt eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "alt", value:  unset'  }
