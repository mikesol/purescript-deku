module Deku.DOM.Attr.Referrerpolicy where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Referrerpolicy = Referrerpolicy

instance Attr A_ Referrerpolicy String where
  attr Referrerpolicy bothValues  = unsafeAttribute $ Both { key: "referrerpolicy", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "referrerpolicy", value:  prop' value  })
  pureAttr Referrerpolicy value  = unsafeAttribute $ This { key: "referrerpolicy", value:  prop' value  }
  unpureAttr Referrerpolicy eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "referrerpolicy", value:  prop' value  }

instance Attr Area_ Referrerpolicy String where
  attr Referrerpolicy bothValues  = unsafeAttribute $ Both { key: "referrerpolicy", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "referrerpolicy", value:  prop' value  })
  pureAttr Referrerpolicy value  = unsafeAttribute $ This { key: "referrerpolicy", value:  prop' value  }
  unpureAttr Referrerpolicy eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "referrerpolicy", value:  prop' value  }

instance Attr Iframe_ Referrerpolicy String where
  attr Referrerpolicy bothValues  = unsafeAttribute $ Both { key: "referrerpolicy", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "referrerpolicy", value:  prop' value  })
  pureAttr Referrerpolicy value  = unsafeAttribute $ This { key: "referrerpolicy", value:  prop' value  }
  unpureAttr Referrerpolicy eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "referrerpolicy", value:  prop' value  }

instance Attr Img_ Referrerpolicy String where
  attr Referrerpolicy bothValues  = unsafeAttribute $ Both { key: "referrerpolicy", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "referrerpolicy", value:  prop' value  })
  pureAttr Referrerpolicy value  = unsafeAttribute $ This { key: "referrerpolicy", value:  prop' value  }
  unpureAttr Referrerpolicy eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "referrerpolicy", value:  prop' value  }

instance Attr Link_ Referrerpolicy String where
  attr Referrerpolicy bothValues  = unsafeAttribute $ Both { key: "referrerpolicy", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "referrerpolicy", value:  prop' value  })
  pureAttr Referrerpolicy value  = unsafeAttribute $ This { key: "referrerpolicy", value:  prop' value  }
  unpureAttr Referrerpolicy eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "referrerpolicy", value:  prop' value  }

instance Attr Script_ Referrerpolicy String where
  attr Referrerpolicy bothValues  = unsafeAttribute $ Both { key: "referrerpolicy", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "referrerpolicy", value:  prop' value  })
  pureAttr Referrerpolicy value  = unsafeAttribute $ This { key: "referrerpolicy", value:  prop' value  }
  unpureAttr Referrerpolicy eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "referrerpolicy", value:  prop' value  }

instance Attr everything Referrerpolicy Unit where
  attr Referrerpolicy bothValues  = unsafeAttribute $ Both { key: "referrerpolicy", value:  unset'  } (snd bothValues <#> \_ -> { key: "referrerpolicy", value:  unset'  })
  pureAttr Referrerpolicy _  = unsafeAttribute $ This { key: "referrerpolicy", value:  unset'  }
  unpureAttr Referrerpolicy eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "referrerpolicy", value:  unset'  }
