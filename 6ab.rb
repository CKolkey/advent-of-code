require 'rspec'

def marker_index(input, preamble:)
  input.chars
       .each_with_object([]) { |packet, buffer| packet_started?(buffer, preamble:) ? next : buffer << packet }
       .size
end

def packet_started?(buffer, preamble:)
  buffer.last(preamble).uniq.size == preamble
end

RSpec.describe do
  context 'with test input' do
    let(:input) { 'mjqjpqmgbljsphdztnvjfqwrcgsmlb' }

    it 'returns correct marker with preamble of 4' do
      expect(marker_index(input, preamble: 4)).to eq 7
    end

    it 'returns correct marker with preamble of 14' do
      expect(marker_index(input, preamble: 14)).to eq 19
    end
  end

  context 'with test input' do
    let(:input) { 'bvwbjplbgvbhsrlpgdmjqwftvncz' }

    it 'returns correct marker with preamble of 4' do
      expect(marker_index(input, preamble: 4)).to eq 5
    end

    it 'returns correct marker with preamble of 14' do
      expect(marker_index(input, preamble: 14)).to eq 23
    end
  end

  context 'with test input' do
    let(:input) { 'nppdvjthqldpwncqszvftbrmjlhg' }

    it 'returns correct marker with preamble of 4' do
      expect(marker_index(input, preamble: 4)).to eq 6
    end

    it 'returns correct marker with preamble of 14' do
      expect(marker_index(input, preamble: 14)).to eq 23
    end
  end

  context 'with test input' do
    let(:input) { 'nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg' }

    it 'returns correct marker with preamble of 4' do
      expect(marker_index(input, preamble: 4)).to eq 10
    end

    it 'returns correct marker with preamble of 14' do
      expect(marker_index(input, preamble: 14)).to eq 29
    end
  end

  context 'with test input' do
    let(:input) { 'zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw' }

    it 'returns correct marker with preamble of 4' do
      expect(marker_index(input, preamble: 4)).to eq 11
    end

    it 'returns correct marker with preamble of 14' do
      expect(marker_index(input, preamble: 14)).to eq 26
    end
  end

  context 'with real input' do
    let(:input) do
      'bgdbdsbsbsttldddzzwnzzmpzmmzmqqcgglrglgbbbtmtddrssjtjqqtrtqtqppcvcddswdwbwlblfljfljlhhpchcfcgfcfwfllfccjlcjllbvbgglccznzrnzzvfzvffvzvccnwnnrtrqtttzmmndnqnvvlwvvgcclplccbggcscqscqcnndwdlwlvlffdssrzrtttbvvqttfdfrddhthbblnlmlmqmhhpvpcpwpccmdddbcbcgctggsstwwbcwwqllchlcccfwccvjcjhhvggnvvcssjwjhhdvdhdcdhdqhhwrwcrwcrrjzjccqhhvnnrppsqqplqqcvczzlpprlrqqvpvwwstwwzqqsnqqsrqrlqlggzztzhhvbbcncwnwhwbbqpbqpqdqsqjqrjrddpjpwwvlwlnwwmpwwnmmzgzqqdcdnnqllghhzwhwwggljjwswgwffsbffbggzfzcfzczpptrrnwrrcqqcwqqdttzqzjzqqltlggwlglgwgrgfgnffgqffnlntlnlccjwjfjnfjnffqvfqfcfsslwswfwvfwfvflfhhntngnhggqbbsggchghfggcmgmsggshsmmqffjpjnngwwftwffgqqvmqqslqslqqdzqzhzbhhdzhhllnzzlmzzltlwwsmswwtswtssvqsqhssfdsdtdjdqqqrffqjffrzrppjpgjjpgpmmzbbrcbbprbpbnpbpcpsspqqfggclcpczzngznzvzlvvcwvwcwdwcddhdbdwdhwhllpjllrmmhbmbgmgmpmhpmpqmpprggvsgvsvbsbbqbmmjdjfddsnnqpnnphppsbpsbpsprpjjqhhvrhvvdhdjhdhwdhhdjjrlrbbzhbbjljhllttrccbdbffznnfmnfnvfvrvbblmltlmmlbmmdqmqnmqqmmhchvcvpccnrccqhccshchshzshschcffpwwbdbqbbjhbhmbhmmzzzcscddbsbnnpzpfzzrfrlrmmzzhshbbtjtbtzbbddrwwhchvhtvvmhvmmwssqqzrzdrdqqntnjnrjrbbgqgzgbzgbzgbzgbbqtbbbqjjgvglvlzlqlbbjwjddjtjbjffcsfsnsnpspgpnnglnngrgqgbqgqtgtfggczzmbbvqqrssdqssgrssdzzvjvccbbgcgppgwwtmwwrnwnfwwnnzmzvvvmnnvdddrmrbrtbrbrvrqqcbbgjgfjfcfttgrrjmrmrttbnnsrnsnzsnzztmtgtjgjljdjtjrtrddtbtjbtjbtthhtmmllngnhgnnhthssgffljlnjllfvlvslvsvwvcvfccgqqtsqtqggbjbtjjtjvjtvtvddttqzqczzcvvdtvthvvfrfmrrclrlflbbhhcllfbbcwwgmwmnmpmgpptnpnjpnjjbqjqjddfdfjjpzzjnnvzzwtwpwfppzhphbbmsbmsbmbqqfpfsscttfrtrzzrznrrrbgbdbtdbdjjsmjmttlbtthbttrprpjppsbsjbjcbclchlhhlttntznnzfnfgnncsncnmmdndnlnclnndqnqssbsjbbrzrtzztszzvnznqqpnpbpnpvnpnhpphvpvfvhhrvhrrpttctjcjvcvzcvcscttqptpffscfsccqhchhdcdczcnzcncnhccfrrbprpbpqppdccjhjvjmjpjmpjjvfvrrwppgjgjjdgdmgdggcpccbrrgssbsjbsjsfscfcvvcrvcrcttbtffpqphpchclccwhcwcbwccbzzlvzvffbrbrbjbwjjqvgtcfnhtjvrcwbfjdbvgtqbvmbtscwzrwdfmwtjvswgrvncmftgmppvlcwjpnpffggrmvgtfqgqmhbhpslfwdfvfmbfndrmgfhdbbtdgvnslzpdfvdttqjpcnbzsjcvrprgrhpglwfwtdcbgdsjhnqjntjnsjcgwccjnvvngfpvqwvnclcsvhmwsrccvbjnnrjspwqdvjpfnfvbsslngzpdgjrcsnqfvdlsqdhdllcndshglztgrrjnptqfvllshmhbgdszvmvqdntpgzdvhstgrppwpdtdqvzsfgqfrgmmjqcsjhvrlmnjvfjghlvwbnqcggpqtrjztfzshnqpzznvlqcmnzvrwqlcbnbpwmljpvdzhbvbgtdjlzflsvzlcqdnsgzfjlccvjclqlzdhqzzrscttjmrvjvcqzvtzqlmsssnfcfmvcgmqjjwdnhtvlqrgdvlbbrffmrpnfsmwwwbnwclrgbfnzlbqvjfqjlfvfnfrhdqstddwnwrmsdnvzwfjfgpwcrfqqzbdwwtzprvqtgvtzbttlhcdczlhvlgrbptztswftvnjmgrnbwpfwnztvqmqbznvnllgjmqrwprvwtnptlbfwbblzsblptwpdwgcvwsbmbrtqfvjsbzfvsfvpwfwbnnfcsddhsnwnvvqthjdgvzgjprtqmvhdqjqhgqppqqcpzfcwzcmrslftgrvbvdsdgfzfmvvcqzcszfwdvghdnlwwpddzdsqsdqvvrwhphbqvcbjbtnqgnqqdsqcmrllhmdvpffnqmrgfddjbrjwflshzswvjtmqgqmzvcnlctvdpjhzzlgpzgprjncrscnlmdhvdqpfllsqgstmssvlzmrtjmgwppfqjsrfmlnszdnhngzhtbbnsnvmtzpfsdcsvsvvjnfnzhrzmvlhrbslrsbgwwcvrzpgcnmjqnvgmzmlvpccrmggtzzhsdtbbcdnpdlnbztgjhttmqdhjphcrbgjtctqmgbfmflgqztztcjqvgsscrmwfbvnrnbgbjgqmwdzhwwnddwgrprhvlgftcbnwjqmcgczpbhfqcqzdbdwhmzfmgvcjdsfzdbrzjjvfrvftdblnlhpbqvdprnsjdpznbbgqpgnnjmcnsbszfwblthtwlwrdphjltclmqnbpcgngdnfpltttsrvdmhrcvlqfplqmqvslwgcbrwrmchscczrfgspwjtdqtlbddbsclrlbmhdzqdrgjfsgldfjmgcglbgjhmghntndqcbgqwmdvczbwgcctzvcrsqqctwwddfhhfhwlsrsljpnrlqtbdzprjbfrjgztwbpnfqnlftzcgrpmpcnljhscfbsqzbsgwqcgbvctnhswhrsmwjgcccdsnbscwllmpstpnrccjspnjqmtgcsgbjzpfvzjrhlvnfblqmcmgcrvnpchwhlsqsbhzhsgdvwmdcwphwccvzmmqqjrvqwphbnmddzcmggmbsqrhbcqmdlgvccbhhmhwdjhhhcwnffthmgfhpltqbhnvdqfrzjdvlppqhzfdgbzbrtfllsbvjjcgbwsbcmfrbjtvzqsntzdzprnpmfpfpgmfprlbcdqbdzjsfjbtczdpdnhlwdhmwsjtvmztbhdbbdgvrtbqsqbsnwjjhlslzcblrwlfpzqlvdvmgqhrpjmbjbntmjsjvgsmdsnctlgtnlqgfvhwqbjbrczpfzmzwgvrphfmnnhrlzwzgthzqnzzmptppzdszlcpjjvbpjbtjfrqtbnpnwsdglbbjftvngcghjlnsqwspmmfdpslsmqtpngbtvvrvbqqdsphfhvsnmhprfclnjmfrtqnlqcbmfrggbstwdbwsvtpvflvfgqltmqjpnfclbwtlwhmqrmzcrbztstgpjrdsnwpqrcnvvnnnszlrtpqjtsnbjrdcthrzrtccgcvnnlzfjlcdnzzqclvtncjbznrlpnzhvcwmrfrzpcldfmfzfpchlmddgvcfdqdhzzdtwhsfcvsthtmqgvhzdpjcgwsmrvwsnqmhdnfqdrrnmjwcpjjftfdhvwrwwtvptzfrmgffdcrhvcmccfqctswzzmlsjvdjzgjgndhmmrwvwmmtrnpgsnmtcqdbdpqjmcddcrbcfmmccnvsfhwtvfhsjfmlfttspfghpfggrffnrwjggqwggrmpzscprvdzmzhwjjcsmpsltzwgchttwpngrlptprqnjzzpbpbcvrclggtqwlcwdpjpnjrhtgqwsvhsswwqtlnglnqnvffrgmlbzthvnhrzvsvclgdmmjzrpfv'
    end

    it 'returns correct marker with preamble of 4' do
      expect(marker_index(input, preamble: 4)).to eq 1794
    end

    it 'returns correct marker with preamble of 14' do
      expect(marker_index(input, preamble: 14)).to eq 2851
    end
  end
end
