module Deku.DOM.Attr.Cite where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Blockquote (Blockquote_)
import Deku.DOM.Elt.Del (Del_)
import Deku.DOM.Elt.Ins (Ins_)
import Deku.DOM.Elt.Q (Q_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Cite = Cite

instance Attr Blockquote_ Cite (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cite bothValues = unsafeAttribute $ Both
    { key: "cite", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cite", value: prop' value })
instance Attr Blockquote_ Cite  String  where
  attr Cite value = unsafeAttribute $ This $ pure $
    { key: "cite", value: prop' value }
instance Attr Blockquote_ Cite (Event.Event  String ) where
  attr Cite eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "cite", value: prop' value }

instance Attr Del_ Cite (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cite bothValues = unsafeAttribute $ Both
    { key: "cite", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cite", value: prop' value })
instance Attr Del_ Cite  String  where
  attr Cite value = unsafeAttribute $ This $ pure $
    { key: "cite", value: prop' value }
instance Attr Del_ Cite (Event.Event  String ) where
  attr Cite eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "cite", value: prop' value }

instance Attr Ins_ Cite (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cite bothValues = unsafeAttribute $ Both
    { key: "cite", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cite", value: prop' value })
instance Attr Ins_ Cite  String  where
  attr Cite value = unsafeAttribute $ This $ pure $
    { key: "cite", value: prop' value }
instance Attr Ins_ Cite (Event.Event  String ) where
  attr Cite eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "cite", value: prop' value }

instance Attr Q_ Cite (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cite bothValues = unsafeAttribute $ Both
    { key: "cite", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cite", value: prop' value })
instance Attr Q_ Cite  String  where
  attr Cite value = unsafeAttribute $ This $ pure $
    { key: "cite", value: prop' value }
instance Attr Q_ Cite (Event.Event  String ) where
  attr Cite eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "cite", value: prop' value }

instance Attr everything Cite (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Cite bothValues = unsafeAttribute $ Both { key: "cite", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "cite", value: unset' })
instance Attr everything Cite  Unit  where
  attr Cite _ = unsafeAttribute $ This $ pure $ { key: "cite", value: unset' }
instance Attr everything Cite (Event.Event  Unit ) where
  attr Cite eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "cite", value: unset' }
