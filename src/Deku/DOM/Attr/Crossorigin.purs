module Deku.DOM.Attr.Crossorigin where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Script (Script_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Crossorigin = Crossorigin

instance Attr Audio_ Crossorigin (NonEmpty.NonEmpty Event.Event  String ) where
  attr Crossorigin bothValues = unsafeAttribute $ Both (pure 
    { key: "crossorigin", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "crossorigin", value: prop' value })
instance Attr Audio_ Crossorigin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Crossorigin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "crossorigin", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "crossorigin", value: prop' value })
instance Attr Audio_ Crossorigin  String  where
  attr Crossorigin value = unsafeAttribute $ This $ pure $
    { key: "crossorigin", value: prop' value }
instance Attr Audio_ Crossorigin (Event.Event  String ) where
  attr Crossorigin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "crossorigin", value: prop' value }

instance Attr Audio_ Crossorigin (ST.ST Global.Global  String ) where
  attr Crossorigin stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "crossorigin", value: prop' value }

instance Attr Img_ Crossorigin (NonEmpty.NonEmpty Event.Event  String ) where
  attr Crossorigin bothValues = unsafeAttribute $ Both (pure 
    { key: "crossorigin", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "crossorigin", value: prop' value })
instance Attr Img_ Crossorigin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Crossorigin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "crossorigin", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "crossorigin", value: prop' value })
instance Attr Img_ Crossorigin  String  where
  attr Crossorigin value = unsafeAttribute $ This $ pure $
    { key: "crossorigin", value: prop' value }
instance Attr Img_ Crossorigin (Event.Event  String ) where
  attr Crossorigin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "crossorigin", value: prop' value }

instance Attr Img_ Crossorigin (ST.ST Global.Global  String ) where
  attr Crossorigin stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "crossorigin", value: prop' value }

instance Attr Link_ Crossorigin (NonEmpty.NonEmpty Event.Event  String ) where
  attr Crossorigin bothValues = unsafeAttribute $ Both (pure 
    { key: "crossorigin", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "crossorigin", value: prop' value })
instance Attr Link_ Crossorigin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Crossorigin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "crossorigin", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "crossorigin", value: prop' value })
instance Attr Link_ Crossorigin  String  where
  attr Crossorigin value = unsafeAttribute $ This $ pure $
    { key: "crossorigin", value: prop' value }
instance Attr Link_ Crossorigin (Event.Event  String ) where
  attr Crossorigin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "crossorigin", value: prop' value }

instance Attr Link_ Crossorigin (ST.ST Global.Global  String ) where
  attr Crossorigin stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "crossorigin", value: prop' value }

instance Attr Script_ Crossorigin (NonEmpty.NonEmpty Event.Event  String ) where
  attr Crossorigin bothValues = unsafeAttribute $ Both (pure 
    { key: "crossorigin", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "crossorigin", value: prop' value })
instance Attr Script_ Crossorigin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Crossorigin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "crossorigin", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "crossorigin", value: prop' value })
instance Attr Script_ Crossorigin  String  where
  attr Crossorigin value = unsafeAttribute $ This $ pure $
    { key: "crossorigin", value: prop' value }
instance Attr Script_ Crossorigin (Event.Event  String ) where
  attr Crossorigin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "crossorigin", value: prop' value }

instance Attr Script_ Crossorigin (ST.ST Global.Global  String ) where
  attr Crossorigin stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "crossorigin", value: prop' value }

instance Attr Video_ Crossorigin (NonEmpty.NonEmpty Event.Event  String ) where
  attr Crossorigin bothValues = unsafeAttribute $ Both (pure 
    { key: "crossorigin", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "crossorigin", value: prop' value })
instance Attr Video_ Crossorigin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Crossorigin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "crossorigin", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "crossorigin", value: prop' value })
instance Attr Video_ Crossorigin  String  where
  attr Crossorigin value = unsafeAttribute $ This $ pure $
    { key: "crossorigin", value: prop' value }
instance Attr Video_ Crossorigin (Event.Event  String ) where
  attr Crossorigin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "crossorigin", value: prop' value }

instance Attr Video_ Crossorigin (ST.ST Global.Global  String ) where
  attr Crossorigin stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "crossorigin", value: prop' value }

instance Attr Image_ Crossorigin (NonEmpty.NonEmpty Event.Event  String ) where
  attr Crossorigin bothValues = unsafeAttribute $ Both (pure 
    { key: "crossorigin", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "crossorigin", value: prop' value })
instance Attr Image_ Crossorigin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Crossorigin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "crossorigin", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "crossorigin", value: prop' value })
instance Attr Image_ Crossorigin  String  where
  attr Crossorigin value = unsafeAttribute $ This $ pure $
    { key: "crossorigin", value: prop' value }
instance Attr Image_ Crossorigin (Event.Event  String ) where
  attr Crossorigin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "crossorigin", value: prop' value }

instance Attr Image_ Crossorigin (ST.ST Global.Global  String ) where
  attr Crossorigin stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "crossorigin", value: prop' value }

instance Attr everything Crossorigin (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Crossorigin bothValues = unsafeAttribute $ Both (pure 
    { key: "crossorigin", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "crossorigin", value: unset' })
instance Attr everything Crossorigin (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Crossorigin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "crossorigin", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "crossorigin", value: unset' })
instance Attr everything Crossorigin  Unit  where
  attr Crossorigin _ = unsafeAttribute $ This $ pure $
    { key: "crossorigin", value: unset' }
instance Attr everything Crossorigin (Event.Event  Unit ) where
  attr Crossorigin eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "crossorigin", value: unset' }

instance Attr everything Crossorigin (ST.ST Global.Global  Unit ) where
  attr Crossorigin stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "crossorigin", value: unset' }
