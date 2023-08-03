module Deku.DOM.Attr.Label where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Optgroup (Optgroup_)
import Deku.DOM.Elt.Option (Option_)
import Deku.DOM.Elt.Track (Track_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Label = Label

instance Attr Optgroup_ Label (NonEmpty.NonEmpty Event.Event  String ) where
  attr Label bothValues = unsafeAttribute $ Both (pure 
    { key: "label", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "label", value: prop' value })
instance Attr Optgroup_ Label (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Label (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "label", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "label", value: prop' value })
instance Attr Optgroup_ Label  String  where
  attr Label value = unsafeAttribute $ This $ pure $
    { key: "label", value: prop' value }
instance Attr Optgroup_ Label (Event.Event  String ) where
  attr Label eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "label", value: prop' value }

instance Attr Optgroup_ Label (ST.ST Global.Global  String ) where
  attr Label stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "label", value: prop' value }

instance Attr Option_ Label (NonEmpty.NonEmpty Event.Event  String ) where
  attr Label bothValues = unsafeAttribute $ Both (pure 
    { key: "label", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "label", value: prop' value })
instance Attr Option_ Label (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Label (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "label", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "label", value: prop' value })
instance Attr Option_ Label  String  where
  attr Label value = unsafeAttribute $ This $ pure $
    { key: "label", value: prop' value }
instance Attr Option_ Label (Event.Event  String ) where
  attr Label eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "label", value: prop' value }

instance Attr Option_ Label (ST.ST Global.Global  String ) where
  attr Label stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "label", value: prop' value }

instance Attr Track_ Label (NonEmpty.NonEmpty Event.Event  String ) where
  attr Label bothValues = unsafeAttribute $ Both (pure 
    { key: "label", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "label", value: prop' value })
instance Attr Track_ Label (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Label (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "label", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "label", value: prop' value })
instance Attr Track_ Label  String  where
  attr Label value = unsafeAttribute $ This $ pure $
    { key: "label", value: prop' value }
instance Attr Track_ Label (Event.Event  String ) where
  attr Label eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "label", value: prop' value }

instance Attr Track_ Label (ST.ST Global.Global  String ) where
  attr Label stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "label", value: prop' value }

instance Attr everything Label (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Label bothValues = unsafeAttribute $ Both (pure  { key: "label", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "label", value: unset' })
instance Attr everything Label (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Label (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "label", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "label", value: unset' })
instance Attr everything Label  Unit  where
  attr Label _ = unsafeAttribute $ This $ pure $ { key: "label", value: unset' }
instance Attr everything Label (Event.Event  Unit ) where
  attr Label eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "label", value: unset' }

instance Attr everything Label (ST.ST Global.Global  Unit ) where
  attr Label stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "label", value: unset' }
