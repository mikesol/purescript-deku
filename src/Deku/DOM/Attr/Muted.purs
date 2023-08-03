module Deku.DOM.Attr.Muted where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Muted = Muted

instance Attr Audio_ Muted (NonEmpty.NonEmpty Event.Event  String ) where
  attr Muted bothValues = unsafeAttribute $ Both (pure 
    { key: "muted", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "muted", value: prop' value })
instance Attr Audio_ Muted (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Muted (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "muted", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "muted", value: prop' value })
instance Attr Audio_ Muted  String  where
  attr Muted value = unsafeAttribute $ This $ pure $
    { key: "muted", value: prop' value }
instance Attr Audio_ Muted (Event.Event  String ) where
  attr Muted eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "muted", value: prop' value }

instance Attr Audio_ Muted (ST.ST Global.Global  String ) where
  attr Muted stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "muted", value: prop' value }

instance Attr Video_ Muted (NonEmpty.NonEmpty Event.Event  String ) where
  attr Muted bothValues = unsafeAttribute $ Both (pure 
    { key: "muted", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "muted", value: prop' value })
instance Attr Video_ Muted (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Muted (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "muted", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "muted", value: prop' value })
instance Attr Video_ Muted  String  where
  attr Muted value = unsafeAttribute $ This $ pure $
    { key: "muted", value: prop' value }
instance Attr Video_ Muted (Event.Event  String ) where
  attr Muted eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "muted", value: prop' value }

instance Attr Video_ Muted (ST.ST Global.Global  String ) where
  attr Muted stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "muted", value: prop' value }

instance Attr everything Muted (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Muted bothValues = unsafeAttribute $ Both (pure  { key: "muted", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "muted", value: unset' })
instance Attr everything Muted (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Muted (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "muted", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "muted", value: unset' })
instance Attr everything Muted  Unit  where
  attr Muted _ = unsafeAttribute $ This $ pure $ { key: "muted", value: unset' }
instance Attr everything Muted (Event.Event  Unit ) where
  attr Muted eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "muted", value: unset' }

instance Attr everything Muted (ST.ST Global.Global  Unit ) where
  attr Muted stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "muted", value: unset' }
