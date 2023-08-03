module Deku.DOM.Attr.Controls where

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

data Controls = Controls

instance Attr Audio_ Controls (NonEmpty.NonEmpty Event.Event  String ) where
  attr Controls bothValues = unsafeAttribute $ Both (pure 
    { key: "controls", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "controls", value: prop' value })
instance Attr Audio_ Controls (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Controls (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "controls", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "controls", value: prop' value })
instance Attr Audio_ Controls  String  where
  attr Controls value = unsafeAttribute $ This $ pure $
    { key: "controls", value: prop' value }
instance Attr Audio_ Controls (Event.Event  String ) where
  attr Controls eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "controls", value: prop' value }

instance Attr Audio_ Controls (ST.ST Global.Global  String ) where
  attr Controls stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "controls", value: prop' value }

instance Attr Video_ Controls (NonEmpty.NonEmpty Event.Event  String ) where
  attr Controls bothValues = unsafeAttribute $ Both (pure 
    { key: "controls", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "controls", value: prop' value })
instance Attr Video_ Controls (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Controls (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "controls", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "controls", value: prop' value })
instance Attr Video_ Controls  String  where
  attr Controls value = unsafeAttribute $ This $ pure $
    { key: "controls", value: prop' value }
instance Attr Video_ Controls (Event.Event  String ) where
  attr Controls eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "controls", value: prop' value }

instance Attr Video_ Controls (ST.ST Global.Global  String ) where
  attr Controls stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "controls", value: prop' value }

instance Attr everything Controls (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Controls bothValues = unsafeAttribute $ Both (pure 
    { key: "controls", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "controls", value: unset' })
instance Attr everything Controls (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Controls (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "controls", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "controls", value: unset' })
instance Attr everything Controls  Unit  where
  attr Controls _ = unsafeAttribute $ This $ pure $
    { key: "controls", value: unset' }
instance Attr everything Controls (Event.Event  Unit ) where
  attr Controls eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "controls", value: unset' }

instance Attr everything Controls (ST.ST Global.Global  Unit ) where
  attr Controls stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "controls", value: unset' }
